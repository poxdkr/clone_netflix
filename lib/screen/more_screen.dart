import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MoreScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding : EdgeInsets.only(top:10),
              child: CircleAvatar(radius: 100, backgroundImage: AssetImage('image/dog.jpg'),),
            ),
            Container(
              padding : EdgeInsets.only(top:15),
              child: Text(
                '해결사다',
                style : TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.white)
              ),
            ),
            Container(
              padding : EdgeInsets.all(10),
              width: 140,
              height: 5,
              color:Colors.red,
            ),
            Container(
              padding : EdgeInsets.all(10),
              child : Text('https://github.com/poxdkr', style: TextStyle(fontSize: 12, color: Colors.white60),)
            ),
            Container(
             padding : EdgeInsets.all(10),
             child : TextButton(
               style: TextButton.styleFrom(backgroundColor: Colors.red),
               onPressed: (){},
               child: Container(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(Icons.edit, color: Colors.white,),
                     SizedBox(width: 10,),
                     Text(
                       '프로필 수정하기',
                       style : TextStyle(color : Colors.white)
                     )
                   ],
                 ),
               ),

             )
            )
          ],
        )
      ),
    );
  }
}
