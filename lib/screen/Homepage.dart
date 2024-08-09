import 'package:flutter/material.dart';
import 'package:pet_care/screen/pet_shop_finder_page.dart';
import 'package:pet_care/screen/adoption_page.dart';
import 'package:pet_care/screen/foster_home_finder_page.dart';
import 'package:pet_care/screen/pet_care_information_page.dart';
import 'package:pet_care/screen/contact_with_vet_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home',style: TextStyle(fontSize: 30, color: Colors.white),),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqKEgk6uWvNPhtrQp0R_OmWPykgpDQxXJw5g&s?crop=1xw:0.74975xh;center,top&resize=1000:*', // Placeholder image URL
              ),
            ),
            const SizedBox(height: 40),
            FeatureButton(
              title: 'Pet Shop Finder',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PetShopFinderPage()),
                );
              },
            ),
            const SizedBox(height: 10),
            FeatureButton(
              title: 'Adoption',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdoptionPage()),
                );
              },
            ),
            const SizedBox(height: 10),
            FeatureButton(
              title: 'Foster Home Finder',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FosterHomeFinderPage()),
                );
              },
            ),
            const SizedBox(height: 10),
            FeatureButton(
              title: 'Pet Care Information',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PetCareInformationPage()),
                );
              },
            ),
            const SizedBox(height: 10),
            FeatureButton(
              title: 'Contact with Vet',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactWithVetPage()),
                );
              },
            ),
            const SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const FeatureButton({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(12), // Reduced padding
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white, // Black text color
              fontSize: 16,
              fontWeight: FontWeight.bold, // Bold text
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded rectangular shape
          ),
          backgroundColor: Colors.red[200], // Baby pink background color
        ),
      ),
    );
  }
}
