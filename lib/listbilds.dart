import 'package:flutter/material.dart';
import 'package:my_library/book_list.dart';
import 'package:my_library/lib.dart';
import 'package:my_library/Bookpage.dart';
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

            width: MediaQuery.of(context).size.width*0.9,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){return Bookpage(book: book);}));
                },
                child: Card(
                  elevation:6,
                  child: Column(
                    children: [
                      Container(
                        height: 170,
                        child: Image.asset(book.img,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
                      ),
                      Text(book.name)
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

            width: MediaQuery.of(context).size.width*0.40,
            child: GestureDetector(
              onTap: (){},
              child: Card(
                elevation: 6,
                child: Column(
                  children: [
                    Container(
                      height: 130,
                      child: Image.asset(lib.picturePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.35,
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
                    ),
                    Text(lib.name)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
