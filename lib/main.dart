import 'package:clone_netflix/screen/home_screen.dart';
import 'package:clone_netflix/widget/bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'netflix',
      theme : ThemeData(brightness: Brightness.dark, primaryColor: Colors.black,accentColor: Colors.white),
      home : DefaultTabController(
          length : 4,
          child : Scaffold(
              body : TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    HomeScreen(),
                    Container(child : Center(child : Text('Search'))),
                    Container(child : Center(child : Text('Save'))),
                    Container(child : Center(child : Text('List'))),
                  ],
              ),
            bottomNavigationBar: Bottom(),
          )
      )
    );
  }
}
