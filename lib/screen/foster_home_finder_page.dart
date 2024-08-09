import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FosterHomeFinderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Foster Home Finder', style: TextStyle(fontSize: 30, color: Colors.white)),
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {
              _createFosterHomePost(context);
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black26, Colors.white12],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: 3, // Number of available foster home posts
                  itemBuilder: (context, index) {
                    return FadeTransition(
                      opacity: _fadeAnimation(context),
                      child: FosterHomePost(
                        fosterHomeName: 'Foster Home $index',
                        location: 'City, Country',
                        services: 'Service details here',
                        price: '\$XX.XX per day',
                        food: 'Type of food provided',
                        imageURL: 'https://as2.ftcdn.net/v2/jpg/03/72/34/75/1000_F_372347566_X8kOj84u51oTyGzxga9Vh68k8Elwqv3D.jpg', // Different image URL for each foster home
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Animation for fading in the list items
  Animation<double> _fadeAnimation(BuildContext context) {
    final animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: Scaffold.of(context),
    );
    final animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    animationController.forward();
    return animation;
  }

  void _createFosterHomePost(BuildContext context) async {
    TextEditingController _houseNameController = TextEditingController();
    TextEditingController _storyController = TextEditingController();

    File? _image;

    final picker = ImagePicker();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Create Foster Home Post'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _houseNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter house name',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _storyController,
                      decoration: InputDecoration(
                        hintText: 'Enter story',
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () async {
                        final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          if (pickedFile != null) {
                            _image = File(pickedFile.path);
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                      ),
                      child: Text('Upload Image'),
                    ),
                    SizedBox(height: 16.0),
                    if (_image != null)
                      ClipOval(
                        child: Image.file(
                          _image!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),

                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  child: Text('Submit'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class FosterHomePost extends StatelessWidget {
  final String fosterHomeName;
  final String location;
  final String services;
  final String price;
  final String food;
  final String imageURL;

  FosterHomePost({
    required this.fosterHomeName,
    required this.location,
    required this.services,
    required this.price,
    required this.food,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              imageURL,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fosterHomeName,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Location: $location',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Services: $services',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Price: $price',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Food: $food',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}