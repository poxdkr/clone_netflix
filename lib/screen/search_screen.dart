import 'package:clone_netflix/model/model_movie.dart';
import 'package:clone_netflix/screen/detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController _controller = TextEditingController();

  FocusNode focusNode = FocusNode();
  String _searchText = "";

  _SearchScreenState(){
    _controller.addListener(() {
        _searchText = _controller.text;
      }
    );
  }

  Widget _buildBody(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return LinearProgressIndicator();
        }else{
          return _buildList(context, snapshot.data!.docs);
        }
      } ,
    );
  }


  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot){
    List<DocumentSnapshot> searchResult = [];
    for(DocumentSnapshot d in snapshot){
      if(d.data().toString().contains(_searchText)){
        searchResult.add(d);
      }
    }

    return Expanded(
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1 / 1.5,
          padding: EdgeInsets.all(5),
          children: searchResult
              .map((data) => _buildListItem(context ,data))
              .toList()
          )
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data){
    final movie = Movie.fromSnapshot(data);
    return InkWell(
      child: Image.asset(
          'image/'+movie.poster,
        ),
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
    );
  }
  //build 함수
  @override
  Widget build(BuildContext context) {
    return Container(
            child: Column(
              children: [
                Padding(padding:EdgeInsets.all(30)),
                //검색창 일체
                Container(
                  color : Colors.black,
                  padding : EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Row(
                    children: [
                      //검색창
                      Expanded(
                          flex : 6,
                          child: TextField(
                            onChanged: (text){
                              setState(() {
                                _searchText = text;
                              });
                            },
                            focusNode: focusNode,
                            style : TextStyle(
                              fontSize: 15,
                            ),
                            //autofocus: true,
                            controller: _controller,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white12,
                              prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white60,
                                  size: 20,
                              ),
                              // (x) 버튼
                              suffixIcon: focusNode.hasFocus
                                  ? IconButton(
                                    icon: Icon(Icons.cancel, size: 20, color: Colors.white60,),
                                    onPressed: (){
                                      setState( (){
                                          _controller.clear();
                                          _searchText = "";
                                        }
                                      );
                                    },
                                  )
                                  : Container(),
                              hintText: '검색',
                              //border Style
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                                borderRadius:  BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder:OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                                borderRadius:  BorderRadius.all(Radius.circular(10)),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                                borderRadius:  BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          )
                      ),
                      //취소 버튼
                      focusNode.hasFocus
                          ? Expanded(
                            child: TextButton(
                                child: Text('취소',style:TextStyle(color:Colors.white60)),
                                onPressed: (){
                                  setState(() {
                                    _controller.clear();
                                    _searchText = "";
                                  });
                                }
                                )
                            )
                          : Expanded(child: Container(), flex : 0),
                    ],
                  ),
                ),
                _buildBody(context),
              ],
            ),
    );
  }
}
