import 'package:flutter/material.dart';
import 'package:my_library/otppage.dart';
import 'package:my_library/sign_up.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('Enter your email to reset your password'),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      // Clear the text field
                      },

                  )
                )
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const OtpPage()),
                        );

                    },
                    child: Text('Send OTP'),
                    ),
                    SizedBox(height: 20),
                    Text('Don\'t have an account?'),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignupPage()),
                        );
                        },
                        child: Text('Register'),
                        ),
                        ],
                        ),
      ),
    );
  }
}