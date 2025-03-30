import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  DateTime? selectedDate;
  String birthDateText = "Select Birth Date";
  String? gender;
  File? _profileImage;

  // Function to pick an image from the gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        birthDateText = DateFormat("dd-MM-yyyy").format(picked);
      });
    }
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Picture
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!) as ImageProvider
                            : const AssetImage(
                                "assets/images/default_profile.png"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Wrap(
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.camera),
                                      title: const Text("Take a photo"),
                                      onTap: () {
                                        Navigator.pop(context);
                                        _pickImage(ImageSource.camera);
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.photo_library),
                                      title: const Text("Choose from gallery"),
                                      onTap: () {
                                        Navigator.pop(context);
                                        _pickImage(ImageSource.gallery);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.camera_alt,
                                color: Colors.white, size: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Name Fields
                const Text('Name of Applicant',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _firstNameController,
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Enter First Name' : null,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _lastNameController,
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Enter Last Name' : null,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                const Text("Birth Date",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                InkWell(
                  onTap: () => _selectDate(context),
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          birthDateText,
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const Icon(Icons.calendar_today, color: Colors.blue),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Text("Gender",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      ),
                  value: gender,
                  items: ["Male", "Female", "Other"]
                      .map((gender) =>
                          DropdownMenuItem(value: gender, child: Text(gender)))
                      .toList(),
                  onChanged: (value) => setState(() => gender = value),
                ),
                const SizedBox(height: 20),
                const Text("Email",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Enter Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter a valid email' : null,
                ),

                const SizedBox(height: 20),
                const Text("Phone Number",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Enter Phone Number',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: _validatePhoneNumber,
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Profile Updated Successfully'),
                            ),
                      );
                    }
                  },
                  child: const Text("Submit", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
