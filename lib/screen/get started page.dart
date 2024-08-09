import 'package:flutter/material.dart';
import 'package:pet_care/screen/loginpage.dart';

class GetStartedPage extends StatelessWidget {
  final String imageUrl;

  GetStartedPage({this.imageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ4BFuC61n9JpNTdHtccSX4NqGoRJFEKp3eQ&s'}); // Default image URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Care", style: TextStyle(fontSize: 30, color: Colors.white)),
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.1, // Adjust size based on screen width
                backgroundImage: NetworkImage(imageUrl), // Use AssetImage for local assets
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to login page after clicking Get Started button
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent, // Button color
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 64.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Rounded button corners
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
