import 'package:flutter/material.dart';

class EditMember extends StatefulWidget {
  const EditMember({super.key});

  @override
  State<EditMember> createState() => _EditMemberState();
}

class _EditMemberState extends State<EditMember> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit Member',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontStyle: FontStyle.italic),
          ),
          backgroundColor: const Color.fromARGB(255, 4, 52, 91),
          elevation: 0,
        ),
        body: Column(children: [
          SizedBox(height: 20),
          Text('Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              labelText: 'Name',
              labelStyle: TextStyle(fontSize: 15),
              prefixIcon: Icon(Icons.person, size: 15),
            ),
          ),
          SizedBox(height: 20),
          Text('Email',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              labelText: 'Email',
              labelStyle: TextStyle(fontSize: 16),
              prefixIcon: Icon(Icons.email, size: 15),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Phone',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              labelText: 'Phone',
              labelStyle: TextStyle(fontSize: 15),
              prefixIcon: Icon(Icons.phone, size: 15),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Member details Updated Successfully'),
                  ),
                );
              }
            },
            child: const Text("Submit", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
          ),
        ]));
  }
}
