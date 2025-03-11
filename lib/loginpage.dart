import 'package:flutter/material.dart';
import 'package:my_library/sign_up.dart';
class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  //final _emailController = TextEditingController();
  //final _passwordController = TextEditingController();
  //final _confirmPasswordController = TextEditingController();
  String? _email;
  String? _password;
  String? _confirmPassword;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In a real app, you'd
      // often want to call a server or save the information.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Processing Data')),
      );
      // Here you can handle the signup logic
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        heightFactor: 10,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SafeArea(child:  Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value;
                        },
                      ),
                      SizedBox(height: 10),
                      
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null; 
                        },
                        onSaved: (value) {
                          _password = value;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed:(){
                         
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text('LOGIN'),
                       
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Dont have an account ?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignupPage()),
                                );
                                },
                                child: Text('sign up '),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
            
        ),
      ),
    );
  }
}