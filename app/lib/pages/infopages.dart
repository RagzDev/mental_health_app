import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DisorderButtonsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DisorderButton(
                title: 'Depression',
                color: Colors.blueGrey,
                icon: Icons.mood_bad,
                page: DepressionPage(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DisorderButton(
                title: 'Anxiety',
                color: Colors.yellow[700]!,
                icon: Icons.sentiment_neutral,
                page: AnxietyPage(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DisorderButton(
                title: 'Bipolar Disorder',
                color: Colors.deepPurple[300]!,
                icon: Icons.people,
                page: BipolarDisorderPage(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DisorderButton(
                title: 'PTSD',
                color: Colors.blueAccent,
                icon: Icons.warning_rounded,
                page: PTSDPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DisorderButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Widget page;

  DisorderButton({
    required this.title,
    required this.icon,
    required this.color,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class DepressionPage extends StatelessWidget {
  const DepressionPage({Key? key}) : super(key: key);

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
          "Depression",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26.0),
        ),
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: NetworkImage(
                    'https://www.verywellhealth.com/thmb/ije9c_2Xlk6NsBz6NlOGTvfJ95U=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/depressionsilhouette-df3e0789612a4d619d50f199d2c75c3e.jpg'),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
              const Text(
                'What is Depression?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Depression is a common mental disorder characterized by persistent sadness and a loss of interest in activities that you normally enjoy, accompanied by an inability to carry out daily activities, for at least two weeks. ',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 16.0),
              const Text(
                'Symptoms of Depression',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                '- Persistent sad, anxious, or "empty" mood\n- Feelings of hopelessness or pessimism\n- Irritability\n- Loss of interest or pleasure in hobbies and activities\n- Fatigue and decreased energy\n- Difficulty concentrating, remembering, or making decisions\n- Insomnia, early-morning awakening, or oversleeping\n- Appetite and/or weight changes\n- Thoughts of death or suicide, or suicide attempts',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Online Resources:',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(40), // Rounded border radius
                      ),
                      minimumSize: Size(120, 40),
                      primary: Colors.blueGrey, // Blue accent color
                    ),
                    onPressed: () => _launchURL(
                        'https://www.nimh.nih.gov/health/topics/depression/index.shtml'),
                    child: Text('National Institute of Mental Health'),
                  ),
                  SizedBox(width: 8.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(40), // Rounded border radius
                      ),
                      minimumSize: Size(120, 40),
                      primary: Colors.blueGrey, // Blue accent color
                    ),
                    onPressed: () => _launchURL(
                        'https://www.mayoclinic.org/diseases-conditions/depression/symptoms-causes/syc-20356007'),
                    child: Text('Mayo Clinic'),
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

class AnxietyPage extends StatelessWidget {
  const AnxietyPage({Key? key}) : super(key: key);

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
          "Anxiety Disorder",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26.0),
        ),
        backgroundColor: Colors.yellow[700]!,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              image: NetworkImage(
                  'https://images.everydayhealth.com/images/how-to-cope-with-anxiety-and-depression-722x406.jpg'),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'What is Anxiety?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Anxiety Disorder is a mental health condition characterized by feelings of worry, anxiety, or fear that are strong enough to interfere with one\'s daily activities.',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Symptoms of Anxiety',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('- Restlessness or feeling keyed up or on edge'),
                  Text('- Being easily fatigued'),
                  Text('- Difficulty concentrating or mind going blank'),
                  Text('- Irritability'),
                  Text('- Muscle tension'),
                  Text('- Difficulty sleeping or staying asleep'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
              child: const Text(
                'Online Resources',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 8,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(40), // Rounded border radius
                      ),
                      minimumSize: Size(120, 40),
                      primary: Colors.yellow[700], // Blue accent color
                    ),
                    onPressed: () => launch('https://www.adaa.org/'),
                    child: const Text('ADAA'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(40), // Rounded border radius
                      ),
                      minimumSize: Size(120, 40),
                      primary: Colors.yellow[700], // Blue accent color
                    ),
                    onPressed: () => launch('https://www.anxiety.org/'),
                    child: const Text('Anxiety.org'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BipolarDisorderPage extends StatelessWidget {
  const BipolarDisorderPage({Key? key}) : super(key: key);

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
          "Bipolar Disorder",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26.0),
        ),
        backgroundColor: Colors.deepPurple[300]!,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
              image: NetworkImage(
                  'https://www.youthdynamics.org/wp-content/uploads/2022/06/18-Quotes-Illustrating-Life-with-Bipolar-Disorder.png'),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What is Bipolar Disorder?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Bipolar disorder is a mental health condition that causes extreme mood swings, including emotional highs (mania or hypomania) and lows (depression).',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Symptoms of Bipolar Disorder',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'The symptoms of bipolar disorder can be severe and debilitating, and may include:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  const Text('• Mania or hypomania'),
                  const Text('• Depression'),
                  const SizedBox(height: 16),
                  const Text(
                    'Online Resources',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                40), // Rounded border radius
                          ),
                          minimumSize: Size(120, 40),
                          primary: Colors.deepPurple[300], // Blue accent color
                        ),
                        onPressed: () => launch(
                            'https://www.nimh.nih.gov/health/topics/bipolar-disorder/index.shtml'),
                        child:
                            const Text('National Institute of Mental Health'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                40), // Rounded border radius
                          ),
                          minimumSize: Size(120, 40),
                          primary: Colors.deepPurple[300], // Blue accent color
                        ),
                        onPressed: () => launch('https://ibpf.org/'),
                        child: const Text('International Bipolar Foundation'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                40), // Rounded border radius
                          ),
                          minimumSize: Size(120, 40),
                          primary: Colors.deepPurple[300], // Blue accent color
                        ),
                        onPressed: () => launch('https://www.dbsalliance.org/'),
                        child: const Text(
                            'Depression and Bipolar Support Alliance'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PTSDPage extends StatelessWidget {
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
          "PTSD",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26.0),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
              image: NetworkImage(
                  'https://st-sophies.com/portals/0/images/patient-resources/disorders/ptsd-character.webp'),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What is Post Traumatic Stress Disorder (PTSD)?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'PTSD stands for Post-Traumatic Stress Disorder. It is a mental health disorder that can develop in people who have experienced or witnessed a traumatic or life-threatening event.',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Symptoms of PTSD',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'The symptoms of PTSD can be very disturbing, and may include:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  const Text('• Flashbacks'),
                  const Text('• Nightmares'),
                  const Text('• Intrusive Thoughts/Memories'),
                  const Text('• Feeling constantly on edge'),
                  const SizedBox(height: 16),
                  const Text(
                    'Online Resources',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                40), // Rounded border radius
                          ),
                          minimumSize: Size(120, 40),
                          primary: Colors.blueAccent, // Blue accent color
                        ),
                        onPressed: () => launch('https://www.ptsd.va.gov/'),
                        child: const Text('National Center for PTSD'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                40), // Rounded border radius
                          ),
                          minimumSize: Size(120, 40),
                          primary: Colors.blueAccent, // Blue accent color
                        ),
                        onPressed: () =>
                            launch('https://www.ptsdalliance.org/'),
                        child: const Text('PTSD Alliance'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
