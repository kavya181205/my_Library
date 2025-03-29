import 'package:flutter/material.dart';
import 'book_list.dart';
import 'package:my_library/Bookpage.dart';// Import your book list model

class FavoritesPage extends StatelessWidget {
  final Set<Book> favoriteBooks;

  const FavoritesPage({Key? key, required this.favoriteBooks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favorite Books"),
        backgroundColor: Colors.blueAccent,
      ),
      body: favoriteBooks.isEmpty
          ? const Center(
              child: Text(
                "No Favorite Books Yet!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: favoriteBooks.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 books per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  Book book = favoriteBooks.elementAt(index);
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){return Bookpage(book: book);}));
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                              child: Image.asset(book.img, fit: BoxFit.cover, width: double.infinity),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              book.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Remove book from favorites and refresh UI
                              (context as Element).markNeedsBuild();
                              favoriteBooks.remove(book);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
