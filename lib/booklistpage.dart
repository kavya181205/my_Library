
import 'package:flutter/material.dart';
import 'package:my_library/Addbooklist.dart';
import 'package:my_library/libbooks.dart';
import 'package:my_library/listbilds.dart';
class Booklist extends StatefulWidget{
  @override
  State<Booklist> createState() => _Booklist();
}
class _Booklist extends State<Booklist>{
  final TextEditingController _controller= TextEditingController();
  int check =1;
  int check2=1;
  List<Libbook> listofbook=Libbooks;
  List<Libbook> listofauth=[];
  List<Libbook> listofid=[];
  void search(){
    setState(() {
      if(check2==1){
        check2=0;
      }
      if(check2==0){
        String input;
        input="";
        input=_controller.text;
        if(input.length>0){
          check=0;
          listofbook=[];
          listofauth=[];
          listofid=[];
          for(var i in Libbooks) {
            var name = i.name.toLowerCase();
            if (name.contains(input.toLowerCase())) {
              listofbook.add(i);
            }
          }
          for(var i in Libbooks){
            var name = i.author.toLowerCase();
            if(name.contains(input.toLowerCase())){
              listofauth.add(i);
            }
          }
          for(var i in Libbooks){
            var name= i.library_Libbookid;
            if(name.toString().contains(input)){
              listofid.add(i);
            }
          }
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
      title: Container(
        child: Row(
          children: [
            if(check2==1)
              Container(
                width: MediaQuery.of(context).size.width*0.60,
                child: Text("Book List"),
              ),
            if(check2==0)
              Row(
                children: [
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(
                        left:5,
                        right:5,
                        top:5,
                        bottom:10
                    ),
                    width: MediaQuery.of(context).size.width*0.6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(7))
                    ),
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        labelText: "search",
                        labelStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black
                        ),
                        border:OutlineInputBorder(),
                        hintText: "Book,Id,Author",
                        hintStyle: TextStyle(fontSize: 20,color: Colors.grey),
                        contentPadding: EdgeInsets.only(top: 2),

                      ),
                    ),
                  ),

                ],
              ),
            IconButton(onPressed: search, icon: Icon(Icons.search))
          ],
        ),
      ),
    backgroundColor: Colors.blue,
    ),

    body: Container(
      padding: EdgeInsets.all(5),
        color: Colors.black12,
        child: Column(
          children: [
           
            SingleChildScrollView(
              child: Column(
                children: [
                  if(listofid.isNotEmpty)
                    Container( width:MediaQuery.of(context).size.width*1,padding: EdgeInsets.all(10),child: Text("Id",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.left,)),
                  if(listofid.isNotEmpty)
                    Container(
                        height: 220,
                        child: libbooksBuild(lilist: listofid)),
                  if(listofbook.isNotEmpty)
                    Container( width:MediaQuery.of(context).size.width*1,padding: EdgeInsets.all(10),child: Text("Books",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.left,)),
                  if(listofbook.isNotEmpty)
                    Container(
                        height: 220,
                        child: libbooksBuild(lilist: listofbook)),
                  if(listofauth.isNotEmpty)
                    Container( width:MediaQuery.of(context).size.width*1,padding: EdgeInsets.all(10),child: Text("Author",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.left,)),
                  if(listofauth.isNotEmpty)
                    Container(
                        height: 220,
                        child: libbooksBuild(lilist: listofauth)),
                  if(check==0 && listofbook.isEmpty && listofauth.isEmpty && listofid.isEmpty)
                    Center(child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height*0.795,
                      child: Text("No result found", style: TextStyle(color: Colors.grey,fontSize: 40),),
                    )
                    ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){return ADDBooklist();}));
      },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),),
    );
  }
  }