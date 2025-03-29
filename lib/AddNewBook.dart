import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/listbilds.dart';
import 'package:my_library/libbooks.dart';
import 'package:my_library/Addbooklist.dart';
class AddNewbook extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AddNewbook();
}
class _AddNewbook extends State<AddNewbook>{
  final TextEditingController _name= TextEditingController();
  final TextEditingController _auth= TextEditingController();
  final TextEditingController _Lid= TextEditingController();
  final TextEditingController _genre= TextEditingController();
  final TextEditingController _desc= TextEditingController();
  final TextEditingController _Qunti= TextEditingController();
  final TextEditingController _Avi= TextEditingController();
  File? _libraryImage;
  Libbook? _book;
  void _setImage(File? image) {
    setState(() {
      _libraryImage = image;
    });
  }
  @override
  Widget build(BuildContext context) {
 return Scaffold(
   appBar: AppBar(
     title: Text("Add New Book"),
     backgroundColor: Colors.blue,
   ),
   body: Container(
     width: MediaQuery.of(context).size.width*1,
     height: MediaQuery.of(context).size.height*1,
     color: Colors.black12,
     child: SingleChildScrollView(
       child: Column(
         children: [
           Container(
             margin: EdgeInsets.all(5),
             height: 250,
             child: Container(
                 decoration: BoxDecoration(
                     border: Border.all(color: Colors.black)
                 ),
                 child: CustomImagePicker(onImageSelected: _setImage)),),
           Container(  margin: EdgeInsets.only(bottom: 10),child: Text("* please filled all details properly ",style: TextStyle(fontSize: 10),),),
           Container(
             margin: EdgeInsets.only(bottom: 10),
             child: TextField(
               controller: _name,
               style: TextStyle(fontSize: 20),
               decoration: InputDecoration(
                 labelText: "Name",
                 labelStyle: TextStyle(
                     fontSize: 12,
                     color: Colors.black
                 ),
                 border:OutlineInputBorder(),
                 hintText: "Book Name",
                 hintStyle: TextStyle(fontSize: 20),
                 contentPadding: EdgeInsets.only(top: 2),

               ),
             ),
           ),
           Container(
             margin: EdgeInsets.only(bottom: 10),
             child: TextField(
               controller: _Lid,
               style: TextStyle(fontSize: 20),
               decoration: InputDecoration(
                 labelText: "Library Id",
                 labelStyle: TextStyle(
                     fontSize: 12,
                     color: Colors.black
                 ),
                 border:OutlineInputBorder(),
                 hintText: "Book Id",
                 hintStyle: TextStyle(fontSize: 20),
                 contentPadding: EdgeInsets.only(top: 2),

               ),
             ),
           ),
           Container(
             margin: EdgeInsets.only(bottom: 10),
             child: TextField(
               controller: _auth,
               style: TextStyle(fontSize: 20),
               decoration: InputDecoration(
                 labelText: "Author",
                 labelStyle: TextStyle(
                     fontSize: 12,
                     color: Colors.black
                 ),
                 border:OutlineInputBorder(),
                 hintText: "Author Name",
                 hintStyle: TextStyle(fontSize: 20),
                 contentPadding: EdgeInsets.only(top: 2),

               ),
             ),
           ),
           Container(
             margin: EdgeInsets.only(bottom: 10),
             child: TextField(
               controller: _desc,
               style: TextStyle(fontSize: 20),
               decoration: InputDecoration(
                 labelText: "description",
                 labelStyle: TextStyle(
                     fontSize: 12,
                     color: Colors.black
                 ),
                 border:OutlineInputBorder(),
                 hintText: "Book Description",
                 hintStyle: TextStyle(fontSize: 20),
                 contentPadding: EdgeInsets.only(top: 2),

               ),
             ),
           ),
           Container(
             margin: EdgeInsets.only(bottom: 10),
             child: TextField(
               controller: _Qunti,
               style: TextStyle(fontSize: 20),
               decoration: InputDecoration(
                 labelText: "Quntity",
                 labelStyle: TextStyle(
                     fontSize: 12,
                     color: Colors.black
                 ),
                 border:OutlineInputBorder(),
                 hintText: "Quntity of Book",
                 hintStyle: TextStyle(fontSize: 20),
                 contentPadding: EdgeInsets.only(top: 2),

               ),
             ),
           ),
           Container(
             margin: EdgeInsets.only(bottom: 10),
             child: TextField(
               controller: _Avi,
               style: TextStyle(fontSize: 20),
               decoration: InputDecoration(
                 labelText: "Available",
                 labelStyle: TextStyle(
                     fontSize: 12,
                     color: Colors.black
                 ),
                 border:OutlineInputBorder(),
                 hintText: "Available Quntity",
                 hintStyle: TextStyle(fontSize: 20),
                 contentPadding: EdgeInsets.only(top: 2),

               ),
             ),
           ),
           if(_libraryImage != null && _Avi!=null && _Qunti!=null && _desc!=null && _name!=null && _auth!=null && _Lid!=null)
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
         ],
       ),
     ),
   )
 );
  }
}
