import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HotlinesPage extends StatelessWidget {
  final List<Map<String, dynamic>> hotlines = [
    {
      'name': 'Vandrevala Foundation',
      'phone': '18602662345',
      'address':
          '2nd Floor, Asha Sadan Building, 15th Road, Khar West, Mumbai, Maharashtra 400052',
    },
    {
      'name': 'iCall - Tata Institute of Social Sciences',
      'phone': '02225521111',
      'address': 'V.N. Purav Marg, Deonar, Mumbai, Maharashtra 400088',
    },
    {
      'name': 'Aasra',
      'phone': '9820466726',
      'address':
          '104, Sunrise Arcade, Plot No. 100, Sector 16, Koparkhairane, Navi Mumbai, Maharashtra 400709',
    },
    {
      'name': 'SAHAI Helpline',
      'phone': '09886444075',
      'address': 'Available Nation-wide',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Hotlines",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26.0),
        ),
        backgroundColor: Colors.red,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: hotlines.length,
        itemBuilder: (BuildContext context, int index) {
          final hotline = hotlines[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text(hotline['name']),
                subtitle: Text(hotline['address']),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(40), // Rounded border radius
                    ),
                    minimumSize: Size(80, 40),
                    primary: Colors.red, // Blue accent color
                  ),
                  onPressed: () {
                    launchUrl(Uri(scheme: 'tel', path: hotline['phone']));
                  },
                  child: Text('Call'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
