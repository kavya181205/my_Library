import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/book_list.dart';


class Bookpage extends StatefulWidget {
  final Book book;
  const Bookpage({super.key, required this.book});

  @override
  State<StatefulWidget> createState() => _bookpage(book: book);
}
class _bookpage extends State<Bookpage>{
  Book book;
  _bookpage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body:Container(
        height: MediaQuery.of(context).size.height*1,
        color: Color(0xFFD5DDE4),
        child: SingleChildScrollView(
          child: Container(

            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [

                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  height: MediaQuery.of(context).size.height*0.4,
                  alignment: Alignment.center,
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Image.asset(book.img)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*1,
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey),top: BorderSide(color: Colors.grey))),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: MediaQuery.of(context).size.width*0.7,
                        child:  Text(book.name,textAlign: TextAlign.left, style: TextStyle(fontSize: 20),),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.share))
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("Author:${book.author}", style: TextStyle(fontSize: 20)),
                        alignment: Alignment.centerLeft),
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Genre:${book.genre}", style: TextStyle(fontSize: 20)),
                          alignment: Alignment.centerLeft),
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Description:${book.description}", style: TextStyle(fontSize: 20)),
                          alignment: Alignment.centerLeft),
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Available at: ", style: TextStyle(fontSize: 20)),
                          alignment: Alignment.centerLeft),
                    ]
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

}