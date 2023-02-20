import 'package:clone_netflix/screen/home_screen.dart';
import 'package:clone_netflix/screen/more_screen.dart';
import 'package:clone_netflix/screen/search_screen.dart';
import 'package:clone_netflix/widget/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
                    SearchScreen(),
                    Container(child : Center(child : Text('Save'))),
                    MoreScreen(),
                  ],
              ),
            bottomNavigationBar: Bottom(),
          )
      )
    );
  }
}
