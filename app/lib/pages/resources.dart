import 'dart:math';
import 'package:app/pages/breathing.dart';
import 'package:app/pages/hotlines.dart';
import 'package:app/pages/recommendations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'infopages.dart';
import 'music.dart';
import 'package:flutter/cupertino.dart';

final storage = FlutterSecureStorage();

Future<String?> getName() async {
  String? name = await storage.read(key: 'name');
  return name;
}

class MentalHealthResources extends StatefulWidget {
  MentalHealthResources({Key? key}) : super(key: key);

  @override
  State<MentalHealthResources> createState() => _MentalHealthResourcesState();
}

class _MentalHealthResourcesState extends State<MentalHealthResources> {
  late String name = "";

  @override
  void initState() {
    super.initState();
    getName().then((value) {
      setState(() {
        name =
            value ?? 'Unknown'; // set a default value if the key doesn't exist
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Welcome, $name",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 32.0),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Text(
                  DateFormat('EEEE, MMMM d, y').format(DateTime.now()),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 8, 8),
                child: Text(
                  "How are you feeling today?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("You're doing great!"),
                          content: Text("Keep up the good work!"),
                          actions: <Widget>[
                            TextButton(
                              child: Text("Thanks!"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: Size(90, 90),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sentiment_very_satisfied, size: 30),
                      Text('Happy'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Hope you feel better."),
                          content: Text(
                              "It's okay to feel sad sometimes. Take some time for yourself and do something that makes you happy. If this doesn't help, talk to our AI therapist."),
                          actions: <Widget>[
                            TextButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: Size(90, 90),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sentiment_very_dissatisfied, size: 30),
                      Text('Sad'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Control your rage."),
                          content: Text(
                              "Take a deep breath and try to let go of your anger. If you need somebody to talk to, try going to the AI therapist on this app."),
                          actions: <Widget>[
                            TextButton(
                              child: Text("OK."),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: Size(90, 90),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sentiment_dissatisfied, size: 30),
                      Text('Angry'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Feeling stressed!"),
                          content: Text(
                              "Take a break and do something that relaxes you. You got this! Try talking to our AI therapist to feel better."),
                          actions: <Widget>[
                            TextButton(
                              child: Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: Size(90, 90),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sentiment_very_dissatisfied_outlined,
                          size: 30),
                      Text('Stressed'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            MotivationalQuoteTile(),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 8, 8),
                child: Text(
                  "Mental Health Resources",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            DisorderButtonsRow(),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 8, 8),
                child: Text(
                  "Need some help?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Container(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(10),
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to hotlines/therapy page
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HotlinesPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_phone,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Talk to Somebody',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PlaylistsPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.music_note,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Calming Music',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to breathing exercises page
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BreathingExercise()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.circle_grid_hex_fill,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Breathing Exercises',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to treatment/recommendations page
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RecommendationsPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.bandage_fill,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Recommendations',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MotivationalQuoteTile extends StatefulWidget {
  @override
  _MotivationalQuoteTileState createState() => _MotivationalQuoteTileState();
}

class _MotivationalQuoteTileState extends State<MotivationalQuoteTile> {
  final List<String> quotes = [
    "Believe in yourself and all that you are. You are amazing.",
    "The future belongs to those who believe in the beauty of their dreams.",
    "If you can dream it, you can achieve it.",
    "You are never too old to set another goal or to dream a new dream.",
    "Don't worry. Be happy.",
    "It's Okay to be Okay."
  ];

  late String _currentQuote;

  @override
  void initState() {
    super.initState();
    _shuffleQuote();
  }

  void _shuffleQuote() {
    setState(() {
      _currentQuote = quotes[Random().nextInt(quotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.0),
              Text(
                "Motivational Quote of the Day",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.0),
              Text(
                _currentQuote,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 12.0),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _shuffleQuote,
          ),
        ),
      ),
    );
  }
}
