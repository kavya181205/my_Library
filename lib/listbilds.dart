import 'package:flutter/material.dart';
import 'package:my_library/book_list.dart';
import 'package:my_library/lib.dart';
import 'package:my_library/Bookpage.dart';
import 'package:my_library/libpage.dart';
class Bookcardbuilder extends StatelessWidget {
  final List<Book> libook;
  const Bookcardbuilder({super.key, required this.libook,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: libook.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          final book = libook[i];

          return Container(

            width: 180,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){return Bookpage(book: book);}));
                },
                child: Card(
                  elevation:6,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        height: 140,
                        child: Image.asset(book.img,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: 160,
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
                      ),
                      Container(padding:EdgeInsets.only(left: 5),child: Text(book.name))
                    ],
                  ),
                ),
              ),
          );
        });
  }
}
class libcardbuilder extends StatelessWidget {
  final List<Library> lilist;
  const libcardbuilder({super.key, required this.lilist,});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lilist.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          final lib = lilist[i];

          return Container(

            width: 350,
            child: GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){return libpage(lib: lib);}));},
              child: Card(
                elevation: 6,
                child: Column(
                  children: [
                    Container(
                      height: 170,
                      child: Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Image.asset(lib.picturePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 330,
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
                    ),
                    Text(lib.name,style: TextStyle(fontSize: 20),)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
