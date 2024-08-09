import 'package:flutter/material.dart';
import 'package:pet_care/screen/get started page.dart'; // Import the get started page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Care App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetStartedPage(),
      debugShowCheckedModeBanner: false,// Change home to GetStartedPage
    );
  }
}
