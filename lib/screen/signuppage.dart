import 'package:flutter/material.dart';
import 'package:pet_care/screen/Homepage.dart';

class SignUppage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Care', style: TextStyle(fontSize: 30, color: Colors.white)),
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
              SizedBox(
                // height: 250,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.1, // Adjust size based on screen width
                  backgroundImage: const NetworkImage('data:image/jpeg;base64,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'),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
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
                child: Text('Sign Up'),
              ),
              const SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ElevatedButton.icon(
              //       onPressed: () {
              //
              //         print('Signing up with Google');
              //       },
              //       icon: Icon(Icons.account_circle), // Placeholder icon
              //       label: Text('Sign up with Google'),
              //     ),
              //     SizedBox(width: 20),
              //     ElevatedButton.icon(
              //       onPressed: () {
              //         // Implement sign up with Apple logic
              //         print('Signing up with Apple');
              //       },
              //       icon: const Icon(Icons.account_circle), // Placeholder icon
              //       label: const Text('Sign up with Apple'),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {

                      print('Navigating to login page');
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Login in',
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
