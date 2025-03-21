import 'package:flutter/material.dart';
import 'package:my_library/book_list.dart'; 

class BookListPage extends StatelessWidget {
  final String selectedGenre;

  const BookListPage({super.key, required this.selectedGenre});

  @override
  Widget build(BuildContext context) {
    List<Book> filteredBooks = books.where((book) => book.genre == selectedGenre).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedGenre,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          ),
          ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, 
          child: Row(
            children: filteredBooks.map((book) {
              return Container(
                width: 150,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        book.img, 
                        height: 180,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      book.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      book.author,
                      style: TextStyle(color: Colors.grey.shade600),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
