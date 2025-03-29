import 'package:flutter/material.dart';
import 'package:my_library/librarian/Member_list.dart';
import 'package:my_library/librarian/book.dart';
import 'package:my_library/librarian/dashboardcard.dart';
import 'package:my_library/librarian/issue_book.dart';
import 'package:my_library/librarian/profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Library',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 52, 91),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 150,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.only(bottom: 0),
                accountName: const Text(
                  'User',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: const Text(
                  'user@example.com',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/library.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            _buildDrawerItem(Icons.home, "Home",Page:Homepage()),
            _buildDrawerItem(Icons.person, "Profile",Page:Profile()),
            _buildDrawerItem(Icons.menu_book, "Add Book",Page:Homepage()),
            _buildDrawerItem(Icons.menu, "Book List",Page:Homepage()),
            _buildDrawerItem(Icons.menu, "Member List",Page:MemberList()),
            _buildDrawerItem(Icons.menu_book, "Issue Book",Page:IssueBook()),
            _buildDrawerItem(Icons.menu_book, "Return Book",Page:Homepage()),
            _buildDrawerItem(Icons.logout, "Log Out",Page:Homepage()),
          ],
        ),
      ),
      body: Column(
        children: [
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/bookstack.jpg',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const Positioned(
                    left: 20,
                    bottom: 10,
                    child: Text(
                      'Library Management system',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 10,
                children: const [
                  DashboardCard(
                      title: 'Total books',
                      iconPath: 'assets/images/book_icon.jpg',
                      count: '16',
                      page: book()),
                  DashboardCard(
                      title: 'Total members',
                      iconPath: 'assets/images/book_icon.jpg',
                      count: '16',
                      page: book()),
                  DashboardCard(
                      title: 'Issued today',
                      iconPath: 'assets/images/book_icon.jpg',
                      count: '16',
                      page: book()),
                  DashboardCard(
                      title: 'Issued (7 days)',
                      iconPath: 'assets/images/book_icon.jpg',
                      count: '16',
                      page: book()),
                  DashboardCard(
                      title: 'Issued all',
                      iconPath: 'assets/images/book_icon.jpg',
                      count: '16',
                      page: book()),
                  DashboardCard(
                      title: 'Due books',
                      iconPath: 'assets/images/book_icon.jpg',
                      count: '16',
                      page: book()),
                  DashboardCard(
                      title: 'Fine collection',
                      iconPath: 'assets/images/book_icon.jpg',
                      count: '16',
                      page: book()),
                  DashboardCard(
                      title: 'Return today',
                      iconPath: 'assets/images/book_icon.jpg',
                      count: '16',
                      page: book()),
                  DashboardCard(
                      title: 'Return(7 days)',
                      iconPath: 'assets/images/book_icon.jpg',
                      count: '16',
                      page: book()),
                   DashboardCard(
                      title: 'Return all',
                      iconPath: 'assets/images/book_icon.jpg',
                      count: '16',
                      page: book()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title,{required Page}) {

    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => Page));
      },
    );
  }
}
