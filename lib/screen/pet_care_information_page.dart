import 'package:flutter/material.dart';

class PetCareInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Care Information',style: TextStyle(fontSize: 30, color: Colors.white)),
        backgroundColor: Colors.pinkAccent, // Vibrant app bar color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black26, Colors.white12],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildCategoryCard(
              context,
              category: 'Common Diseases and Symptoms',
              description: 'Information on common diseases and their symptoms for pets.',
              icon: Icons.healing,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SymptomsPage()));
              },
            ),
            SizedBox(height: 16.0),
            _buildCategoryCard(
              context,
              category: 'First Aid for Emergencies',
              description: 'First aid instructions for emergencies related to various diseases.',
              icon: Icons.medical_services,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FirstAidPage()));
              },
            ),
            SizedBox(height: 16.0),
            _buildCategoryCard(
              context,
              category: 'Vaccination Schedules',
              description: 'Vaccination schedules and information for pets.',
              icon: Icons.local_hospital,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => VaccinationPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, {required String category, required String description, required IconData icon, required VoidCallback onTap}) {
    return Card(

      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.red[50],
      child: ListTile(
        leading: Icon(
          icon,
          size: 48.0,
          color: Colors.deepPurpleAccent,
        ),
        title: Text(
          category,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            color: Colors.grey[700],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

class SymptomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptoms',style: TextStyle(fontSize: 30, color: Colors.white)),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black26, Colors.white10],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildSymptomItem(context, disease: 'Fever', symptom: 'High body temperature, lethargy, loss of appetite'),
            _buildSymptomItem(context, disease: 'Cough', symptom: 'Persistent coughing, difficulty breathing'),
            _buildSymptomItem(context, disease: 'Diarrhea', symptom: 'Watery stools, vomiting, dehydration'),
          ],
        ),
      ),
    );
  }

  Widget _buildSymptomItem(BuildContext context, {required String disease, required String symptom}) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.red[50],
      child: ListTile(
        title: Text(
          disease,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          ),
        ),
        subtitle: Text(symptom),
      ),
    );
  }
}

class FirstAidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid',style: TextStyle(fontSize: 30, color: Colors.white)),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black26, Colors.white10],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildFirstAidItem(context, disease: 'Burns', firstAid: 'Cool the affected area with water, cover with sterile bandage'),
            _buildFirstAidItem(context, disease: 'Bleeding', firstAid: 'Apply pressure to stop bleeding, elevate wound if possible'),
            _buildFirstAidItem(context, disease: 'Choking', firstAid: 'Perform Heimlich maneuver, check airway for obstruction'),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstAidItem(BuildContext context, {required String disease, required String firstAid}) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.red[50],
      child: ListTile(
        title: Text(
          disease,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          ),
        ),
        subtitle: Text(firstAid),
      ),
    );
  }
}

class VaccinationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccination Schedule',style: TextStyle(fontSize: 30, color: Colors.white)),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black26, Colors.white10],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildVaccinationItem(context, pet: 'Dog', vaccine: 'Rabies Vaccine', schedule: 'Every 1-3 years'),
            _buildVaccinationItem(context, pet: 'Dog', vaccine: 'Distemper Vaccine', schedule: 'Every 1-3 years'),
            _buildVaccinationItem(context, pet: 'Cat', vaccine: 'Rabies Vaccine', schedule: 'Every 1-3 years'),
            _buildVaccinationItem(context, pet: 'Cat', vaccine: 'Feline Leukemia Vaccine', schedule: 'Every 1-3 years'),
          ],
        ),
      ),
    );
  }

  Widget _buildVaccinationItem(BuildContext context, {required String pet, required String vaccine, required String schedule}) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.red[50],
      child: ListTile(
        title: Text(
          '$pet - $vaccine',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          ),
        ),
        subtitle: Text('Schedule: $schedule'),
      ),
    );
  }
}
