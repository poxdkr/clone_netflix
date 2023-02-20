import 'package:clone_netflix/model/model_movie.dart';
import 'package:clone_netflix/widget/box_slider.dart';
import 'package:clone_netflix/widget/carousel_image.dart';
import 'package:clone_netflix/widget/circle_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Movie> movies =[];

  @override
  void initState() {

    super.initState();
    Stream<QuerySnapshot> streamData = firestore.collection('movie').snapshots();
  }

  Widget _fetchData(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return LinearProgressIndicator();
        }else{
          return _buildBody(context,snapshot.data!.docs);
        }
      },
    );
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot){
    List<Movie> movies = snapshot.map((m)=> Movie.fromSnapshot(m)).toList();
    return ListView(
      children: [
        Stack(
          children: [
            TopBar(),
            CarouselImage(movies: movies),
          ],
        ),
        CircleSlider(movies: movies),
        BoxSlider(movies: movies)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}

class TopBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
              'image/netflix_logo.png',
            fit:BoxFit.contain,
            height:25
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child : Text(
              'TV 프로그램',
              style : TextStyle(fontSize:14)
            )
          ),
          Container(
              padding: EdgeInsets.only(right: 1),
              child : Text(
                  '영화',
                  style : TextStyle(fontSize:14)
              )
          ),
          Container(
              padding: EdgeInsets.only(right: 1),
              child : Text(
                  '내가 찜한 컨텐츠',
                  style : TextStyle(fontSize:14)
              )
          )
        ]
      )
    );
  }
}
