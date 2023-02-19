import 'package:clone_netflix/model/model_movie.dart';
import 'package:clone_netflix/widget/box_slider.dart';
import 'package:clone_netflix/widget/carousel_image.dart';
import 'package:clone_netflix/widget/circle_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies =[
      Movie.fromMap({
        'title' : '사랑의불시착',
        'keyword' : '사랑/로맨스/판타지',
        'poster' : 'movie_1.jpg',
        'like' : false
      }),
    Movie.fromMap({
      'title' : '기생충',
      'keyword' : '스릴러/미스테리/범죄',
      'poster' : 'movie_2.jpg',
      'like' : false
    }),
    Movie.fromMap({
      'title' : '조커',
      'keyword' : '범죄/액션/스릴러',
      'poster' : 'movie_3.jpg',
      'like' : false
    }),
    Movie.fromMap({
      'title' : '스타워즈',
      'keyword' : '우주/액션/판타지',
      'poster' : 'movie_4.jpg',
      'like' : false
    })
];

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
