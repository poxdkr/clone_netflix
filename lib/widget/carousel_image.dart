import 'package:carousel_slider/carousel_slider.dart';
import 'package:clone_netflix/model/model_movie.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatefulWidget {

  final List<Movie> movies;

  CarouselImage({super.key, required this.movies});

  State<CarouselImage> createState() => _CarouselImageState();

}

class _CarouselImageState extends State<CarouselImage> {
  List<Movie>? movies;
  List<String>? titles;
  List<Widget>? images;
  List<String>? keywords;
  List<bool>? likes;
  int _currentPage = 0;
  String? _currentKeyword;
  String? _currentTitle;

 @override
  void initState() {
    super.initState();
    movies= widget.movies;
    images = movies?.map((m) => Image.asset('./image/' + m.poster)).toList();
    titles = movies?.map((m) => m.title).toList();
    keywords = movies?.map((m) => m.keyword).toList();
    likes = movies?.map((m) => m.like).toList();
    _currentKeyword = keywords?[0];
    _currentTitle = titles?[0];
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding : EdgeInsets.all(20),
          ),
          CarouselSlider(
            items: images,
            options: CarouselOptions(
              autoPlay: true,
              onPageChanged: (index,reason) {
                    setState(() {
                      _currentPage = index;
                      _currentKeyword = keywords?[_currentPage];
                      _currentTitle = titles?[_currentPage];
                    });
              },
            ),
          ),
          Container(
            padding : EdgeInsets.fromLTRB(0, 10, 0, 3),
            child : Column(
              children: [
                Text(_currentTitle!, style: TextStyle(fontSize: 12),),
                Text(_currentKeyword!, style: TextStyle(fontSize: 11),),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child : Column(
                    children: <Widget>[
                      likes![_currentPage]
                      ? IconButton(icon : Icon(Icons.check), onPressed: (){
                        setState(() {
                          likes![_currentPage] = false;
                        });

                      })
                      : IconButton(icon : Icon(Icons.add), onPressed: (){
                        setState(() {
                          likes![_currentPage] = true;
                        });
                      }),
                      Text(
                        '내가 찜한 콘텐츠',
                        style : TextStyle(fontSize: 11)
                      )
                    ],
                  )
                ),
                Container(
                  padding : EdgeInsets.only(right : 10),
                  child : TextButton(
                    child: Row(
                      children: [
                        Icon(Icons.play_arrow, color : Colors.black),
                        Padding(padding: EdgeInsets.all(3),),
                        Text('재생', style: TextStyle(color: Colors.black),)
                      ],
                    ),
                    onPressed: (){},
                    style : TextButton.styleFrom(backgroundColor: Colors.white),
                  )
                ),
                Container(padding : EdgeInsets.only(right: 10),
                  child: Column(
                    children : [
                      IconButton(
                        icon:Icon(Icons.info),
                        onPressed: (){},
                      ),
                      Text(
                        '정보',
                        style: TextStyle(
                            fontSize: 11
                        ),
                      )
                    ]
                  ),
                ),
              ],
            ),
          ),
          Container(
              child : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: makeIndicator(likes!, _currentPage),
              )
          )
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage){
  List<Widget> result = [];

  for(var i =0; i< list.length; i++){
    result.add(Container(
      width : 8,
      height : 8,
      margin : EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      decoration: BoxDecoration(
          shape : BoxShape.circle,
          color : _currentPage == i
                  ? Color.fromRGBO(255, 255, 255, 0.9)
                  : Color.fromRGBO(255, 255, 255, 0.4)
      ),
    ));
  }

  return result;
}


