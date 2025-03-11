import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_library/book_list.dart';
import 'package:my_library/loginpage.dart';
import 'package:my_library/profilepage.dart';
import 'package:my_library/sign_up.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  final List<String> imageList = [
    'assets/images/andrews-library-best-libraries-in-surat-264x300.jpg',
    'assets/images/narbad_library_after.jpg',
    'assets/images/shri-keshubhai-patel-smc-library-surat-libraries-1536x864.webp',
  ];

  final Map<String, String> filters = {
    'Fiction': 'Books that tell made-up stories.',
    'Non-Fiction': 'Books that are based on real events and facts.',
    'Science Fiction': 'Books with futuristic and scientific themes.',
    'Fantasy': 'Books with magical or supernatural elements.',
  };
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Library"),
        backgroundColor: Colors.blue,
        actions: [
          isLoggedIn
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child:const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.blue),
                    ),
                  ),
                )
              : Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Loginpage()),
                        );
                      },
                      child:
                          Text("Login", style: TextStyle(color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child:
                          Text("Signup", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Welcome!",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text("Books"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 50, // Fixed height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  String key = filters.keys.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Chip(
                      label: Text(
                        key,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      backgroundColor: Colors.blue.shade100,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                initialPage: 0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                enlargeCenterPage: true,
                viewportFraction: 1.0,
              ),
              items: imageList.map((imagePath) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Fiction',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 130,
                    height: 250,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          books[index].img,
                          fit: BoxFit.cover,
                          height: 200,
                          width: 200,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
           Text(
            "abs"
            
           )
          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Create'),
        ],
      ),
    );
  }
}

