import 'package:flutter/material.dart';
import 'package:my_library/book_list.dart';
import 'package:my_library/lib.dart';
import 'package:my_library/listbilds.dart';
class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _Searchpage();

}
class _Searchpage extends State<Searchpage>{
  final TextEditingController _controller= TextEditingController();
   late String input;
    List<Book> listofbook=[];
    List<Book> listofauth=[];
    List<Library> listoflib=[];
    int check=1;
    void search(){
      setState(() {
        input="";
        check=0;
        input=_controller.text;
        if(input.length>0){
          listofbook=[];
          listofauth=[];
          listoflib=[];
          for(var i in books) {
            var name = i.name.toLowerCase();
            if (name.contains(input.toLowerCase())) {
              listofbook.add(i);
            }
          }
          for(var i in books){
            var name = i.author.toLowerCase();
            if(name.contains(input.toLowerCase())){
              listofauth.add(i);
            }
          }
          for(var i in libraryList){
            var name= i.name.toLowerCase();
            if(name.contains(input.toLowerCase())){
              listoflib.add(i);
            }
          }
        }
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Searchpage",style: TextStyle(color: Colors.white,fontSize:30)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white10,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: 6,
                    bottom: 5
                ),
                height:50,
                decoration: BoxDecoration(
                    color: Colors.white12,
                    border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(3))
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left:5,
                          right:5,
                          top:5,
                          bottom:5
                      ),
                      width: 260,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(5))
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
                          hintText: "Book,Author,Genre",
                          hintStyle: TextStyle(fontSize: 20),
                          contentPadding: EdgeInsets.only(top: 2),

                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: 100,
                        padding: EdgeInsets.only(left: 3),
                        child: ElevatedButton(
                            onPressed: search ,
                            child: Text("Search",style: TextStyle(fontSize: 12),),
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
              if(listofbook.isNotEmpty)
              Container( width:MediaQuery.of(context).size.width*1,child: Text("Books",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.left,)),
              if(listofbook.isNotEmpty)
              Container(
                height: 210,
                child: Bookcardbuilder(libook: listofbook)),
              if(listofauth.isNotEmpty)
              Container( width:MediaQuery.of(context).size.width*1,child: Text("Authors",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.left,)),
              if(listofauth.isNotEmpty)
              Container(
                  height: 210,
                  child: Bookcardbuilder(libook: listofauth)),
              if(listoflib.isNotEmpty)
              Container( width:MediaQuery.of(context).size.width*1,child: Text("library",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.left,)),
              if(listoflib.isNotEmpty)
              Container(
                  height: 220,
                  child: libcardbuilder(lilist: listoflib)),
              if(check==0 && listofbook.isEmpty && listofauth.isEmpty && listoflib.isEmpty)
                Center(child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height*0.80,
                  child: Text("No result found", style: TextStyle(color: Colors.grey,fontSize: 40),),
                )
                )
            ],
          ),
        ),
      ),
    );
  }

}