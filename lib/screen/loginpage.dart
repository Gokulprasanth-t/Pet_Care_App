import 'package:flutter/material.dart';
import 'package:pet_care/screen/Homepage.dart';
import 'package:pet_care/screen/signuppage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pet Care',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.pink[50], // Baby pink background color
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              SizedBox(
                height: 250,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.2,
                  backgroundImage: const NetworkImage('data:image/jpeg;base64,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'),
                ),
              ),
              const SizedBox(height: 20),

              // Header Text
              const Text(
                'Log in',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Email TextField


              SizedBox(
                width: 300, // Width of the text fields
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.white, // White background color for text field
                  ),
                ),
              ),


              const SizedBox(height: 20),
              SizedBox(
                width: 300, // Width of the text fields
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white, // White background color for text field
                  ),
                ),
              ),
              const SizedBox(height: 20),



              ElevatedButton(
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Colors.pinkAccent,
                // ),
                onPressed: () {

                  String email = _emailController.text;
                  String password = _passwordController.text;

                  print('Email: $email');
                  print('Password: $password');

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()), // Navigate to home page
                  );
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(fontSize: 18),
                ),
              ),


              // Sign-Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Navigating to sign up page');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUppage()),
                      );
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
