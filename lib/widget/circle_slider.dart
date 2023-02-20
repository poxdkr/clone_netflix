import 'package:clone_netflix/model/model_movie.dart';
import 'package:clone_netflix/screen/detail_screen.dart';
import 'package:flutter/material.dart';

class CircleSlider extends StatelessWidget {

  final List<Movie> movies;
  CircleSlider({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding : EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('미리보기'),
          Container(
            height:120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeCicleImages(context, movies!)
              ,
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeCicleImages(BuildContext context, List<Movie> movies){
  List<Widget> results = [];
  for(var i=0; i<movies.length; i++){
    results.add(
      InkWell(
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (BuildContext context){
                    return DetailScreen(movie:movies[i]);
                  }
              )
          );
        },
        child: Container(
          padding : EdgeInsets.only(right:10),
          child : Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundImage: AssetImage('image/'+movies[i].poster),
              radius: 48,
            ),
          )
        ),
      )
    );
  }
  return results;
}