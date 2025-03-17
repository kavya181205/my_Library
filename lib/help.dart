import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class Help extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height*1,
        width: MediaQuery.of(context).size.width*1,
        padding: EdgeInsets.only(top: 10,left:5),
        color: Color(0xFFD5DDE4),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.mail_outline,color: Colors.pink,),
                Text(" ph3918583@gmail.com",style: TextStyle(fontSize: 20),)
              ],
            ),
            Row(
              children: [
                Icon(Icons.mail_outline,color: Colors.pink,),
                Text(" kavya@gmail.com",style: TextStyle(fontSize: 20),)
              ],
            ),
            Row(
              children: [
                Icon(Icons.phone_android,color: Colors.pink,),
                Text(" +91*********2(whatshapp)",style: TextStyle(fontSize: 20),)
              ],
            )
          ],
        ),
      ),
    );

  }

}