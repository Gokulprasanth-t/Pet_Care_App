import 'package:flutter/material.dart';

class ContactWithVetPage extends StatefulWidget {
  @override
  _ContactWithVetPageState createState() => _ContactWithVetPageState();
}

class _ContactWithVetPageState extends State<ContactWithVetPage> {
  final List<String> _locations = ['Kochi', 'Coimbatore', 'Chennai']; // Replace with actual locations
  String? _selectedLocation;
  TimeOfDay _selectedTime = TimeOfDay.now();
  final _hospitalNameController = TextEditingController();
  final _doctorNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact with Vet', style: TextStyle(fontSize: 30, color: Colors.white)),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          _buildHospitalCard(
            context,
            hospitalName: 'Happy Paws Veterinary Clinic',
            image: 'https://as2.ftcdn.net/v2/jpg/02/01/41/98/1000_F_201419808_mCqd8ndCLuzUpZe91KImLGURhJyv22oe.jpg',
          ),
          SizedBox(height: 10),
          _buildHospitalCard(
            context,
            hospitalName: 'Healthy Pets Animal Hospital',
            image: 'https://as2.ftcdn.net/v2/jpg/06/32/51/69/1000_F_632516921_FuyFavolkc5xwdXnC16WPcPoQGX2aob9.jpg',
          ),
          SizedBox(height: 10),
          _buildHospitalCard(
            context,
            hospitalName: 'Paws & Claws Veterinary Center',
            image: 'https://as2.ftcdn.net/v2/jpg/06/32/51/69/1000_F_632516929_J0FmJ0WLaf0KNCRhp1hp75az14dcn9GW.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildHospitalCard(BuildContext context, {required String hospitalName, required String image}) {
    return Card(
      color: Colors.red[100],
      margin: EdgeInsets.all(8.0),
      elevation: 4.0,
      child: ListTile(
        leading: CircleAvatar(
          radius: 25.0,
          backgroundImage: NetworkImage(image),
        ),
        title: Text(hospitalName),
        trailing: ElevatedButton(
          onPressed: () {
            _showAppointmentForm(context, hospitalName);
          },
          child: Text('Book Appointment'),
        ),
      ),
    );
  }

  void _showAppointmentForm(BuildContext context, String hospitalName) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Book Appointment'),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hospital: $hospitalName',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _doctorNameController,
                      decoration: InputDecoration(
                        labelText: 'Doctor\'s Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    DropdownButtonFormField<String>(
                      value: _selectedLocation,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                        });
                      },
                      items: _locations.map<DropdownMenuItem<String>>((String location) {
                        return DropdownMenuItem<String>(
                          value: location,
                          child: Text(location),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Select Location',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Text(
                          'Choose Time: ${_selectedTime.format(context)}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(width: 16.0),
                        ElevatedButton(
                          onPressed: () async {
                            final TimeOfDay? picked = await showTimePicker(
                              context: context,
                              initialTime: _selectedTime,
                            );
                            if (picked != null && picked != _selectedTime) {
                              setState(() {
                                _selectedTime = picked;
                              });
                            }
                          },
                          child: Text('Pick Time'),
                        ),
                      ],
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
                    // Handle form submission
                    _submitForm(hospitalName);
                  },
                  child: Text('Submit'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _submitForm(String hospitalName) {
    final doctorName = _doctorNameController.text;
    final location = _selectedLocation;

    // For now, just showing a dialog with the entered information
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Appointment Details'),
          content: Text(
            'Hospital: $hospitalName\n'
                'Doctor: $doctorName\n'
                'Location: $location\n'
                'Time: ${_selectedTime.format(context)}',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
