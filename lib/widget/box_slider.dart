import 'package:clone_netflix/model/model_movie.dart';
import 'package:flutter/material.dart';

class BoxSlider extends StatelessWidget {

  final List<Movie> movies;

  BoxSlider({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding : EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('지금 뜨는 컨텐츠'),
          Container(
            height : 120,
            child : ListView(
              scrollDirection: Axis.horizontal,
              children: makeboxImages(movies),
            )
          )
        ],
      ),
    );
  }
}

List<Widget> makeboxImages(movies){
  List<Widget> results = [];
  for(var i=0; i<movies.length; i++){
    results.add(
        InkWell(
          onTap: (){},
          child: Container(
              padding : EdgeInsets.only(right:10),
              child : Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('image/'+movies[i].poster),
              )
          ),
        )
    );
  }
  return results;
}