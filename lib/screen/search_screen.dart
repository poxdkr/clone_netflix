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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding:EdgeInsets.all(30)),
          Container(
            color : Colors.black,
            padding : EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Row(
              children: [

              ],
            ),
          )
        ],
      ),
    );
  }
}
