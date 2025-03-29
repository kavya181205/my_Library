import 'package:flutter/material.dart';
import 'package:my_library/librarian/editmember.dart';
import 'package:my_library/librarian/addmember.dart';

class MemberList extends StatefulWidget {
  const MemberList({super.key});

  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> filteredMembers = [];

  List<Map<String, String>> members = [
    {'id': '10011', 'name': 'Kavya Patel', 'Emailid': 'abcdqwe@gmail.com', 'Phone No': '1234567892'},
    {'id': '10010', 'name': 'Krisha Dedhia', 'Emailid': 'abcdqwe@gmail.com', 'Phone No': '1234567892'},
    {'id': '10025', 'name': 'Khanak Patel', 'Emailid': 'abcdqwe@gmail.com', 'Phone No': '1234567892'},
    {'id': '10021', 'name': 'Udit Chauhan', 'Emailid': 'abcdqwe@gmail.com', 'Phone No': '1234567892'},
    {'id': '10024', 'name': 'Kshitij Patel', 'Emailid': 'abcdqwe@gmail.com', 'Phone No': '1234567892'},
    {'id': '10032', 'name': 'Harsh Patel', 'Emailid': 'abcdqwe@gmail.com', 'Phone No': '1234567892'},
    {'id': '10054', 'name': 'Kartik Raj', 'Emailid': 'abcdqwe@gmail.com', 'Phone No': '1234567892'},
  ];

  @override
  void initState() {
    super.initState();
    filteredMembers = List.from(members);
  }

  void _filterMembers(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredMembers = List.from(members);
      } else {
        filteredMembers = members.where((member) {
          return member['id']!.contains(query) ||
              member['name']!.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  void _deleteMember(String id) {
    setState(() {
      members.removeWhere((m) => m['id'] == id);
      filteredMembers = List.from(members);
    });
  }

  void _addMember(Map<String, String> newMember) {
    setState(() {
      members.add(newMember);
      _filterMembers(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 39, 154),
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search by ID or Name...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white70),
                ),
                style: const TextStyle(color: Colors.white),
                onChanged: _filterMembers,
              )
            : const Text('Member List', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search, color: Colors.white),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  _filterMembers('');
                }
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: filteredMembers.length,
        itemBuilder: (context, index) {
          final member = filteredMembers[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Text(
                member['id']!,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              title: Text(
                member['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(member['Emailid']!),
                  Text(member['Phone No']!),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EditMember()),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Delete Member', style: TextStyle(fontWeight: FontWeight.bold)),
                            content: const Text('Are you sure you want to remove this member?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                              ),
                              TextButton(
                                onPressed: () {
                                  _deleteMember(member['id']!);
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Yes', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newMember = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMember()),
          );

          if (newMember != null) {
            _addMember(newMember);
          }
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.person_add, color: Colors.white),
      ),
    );
  }
}
