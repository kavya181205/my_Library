import 'package:flutter/material.dart';
import 'package:my_library/book_list.dart';
import 'package:my_library/libbooks.dart';
import 'package:my_library/Addbooklist.dart';
class AddBookdetailspage extends StatefulWidget {
  final Book book;
  const AddBookdetailspage({super.key, required this.book});

  @override
  State<StatefulWidget> createState() => _addbookdetailspage(book: book);
}
class _addbookdetailspage extends State<AddBookdetailspage>{
  late Libbook input;
  bool setst = false;
  final TextEditingController Qunti= TextEditingController();
  final TextEditingController Avi= TextEditingController();
  final TextEditingController lid= TextEditingController();
  Book book;
  _addbookdetailspage({required this.book});


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
                    ],
                  ),
                ),
                Container(
                  child: Column(
                      children: [

                          Container(
                            child: TextField(
                              controller: lid,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "Library Id",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black
                                ),
                                border:OutlineInputBorder(),
                                hintText: "Library Id",
                                hintStyle: TextStyle(fontSize: 20),
                                contentPadding: EdgeInsets.only(top: 2),

                              ),
                            ),
                          ),
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
                            child: TextField(
                              controller: Qunti,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                labelText: "Quntity",
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black
                                ),
                                border:OutlineInputBorder(),
                                hintText: "Quntity",
                                hintStyle: TextStyle(fontSize: 20),
                                contentPadding: EdgeInsets.only(top: 2),
                              ),
                            ),
                          ),
                        Container(
                          child: TextField(
                            controller: Avi,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              labelText: "Avilable",
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black
                              ),
                              border:OutlineInputBorder(),
                              hintText: "Currenty Avilable ",
                              hintStyle: TextStyle(fontSize: 20),
                              contentPadding: EdgeInsets.only(top: 2),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed:(){
                              Navigator.push(context, MaterialPageRoute(builder:  (context){return ADDBooklist();}));
                            } ,
                            child: Text("ADD",style: TextStyle(fontSize: 20),),
                            style:ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)
                                )
                            ) ,
                          ),
                        ),
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