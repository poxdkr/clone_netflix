import 'package:clone_netflix/model/model_movie.dart';
import 'package:clone_netflix/screen/detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LikeScreen extends StatefulWidget {

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {

  Widget _buildBody(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('movie').where('like', isEqualTo: true).snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return LinearProgressIndicator();
          }else{
            return _buildList(context, snapshot.data!.docs);
          }
        },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> docs){
    return Expanded(
        child: GridView.count(
              childAspectRatio: 1/1.5,
              crossAxisCount: 3,
              padding: EdgeInsets.all(10),
              children: docs.map((m) => _buildListItem(context,m)).toList(),
          ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot){
    final movie = Movie.fromSnapshot(snapshot);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) {
                    return DetailScreen(movie: movie);
                  },
              )
          );
        },
        child: Image.asset('image/'+movie.poster),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(20)),
        Container(
          child: Text('내가 찜한 목록'),
        ),
        _buildBody(context)
      ],
    );
    //return _buildBody(context);
  }
}
