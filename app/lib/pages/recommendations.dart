import 'package:flutter/material.dart';

class RecommendationsPage extends StatelessWidget {
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
          "Recommendations",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26.0),
        ),
        backgroundColor: Colors.orange[400],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildRecommendationCard(
              'Practice Deep Breathing',
              'Take a few minutes to sit down, close your eyes, and focus on your breathing. Inhale deeply through your nose and exhale slowly through your mouth. Repeat several times until you feel relaxed.',
            ),
            _buildRecommendationCard(
              'Talk to Someone',
              'Reach out to a friend, family member, or mental health professional. Sometimes just talking about your feelings can help relieve stress and anxiety.',
            ),
            _buildRecommendationCard(
              'Get Some Exercise',
              'Go for a walk, run, or bike ride. Exercise releases endorphins, which are natural mood boosters. It can also help reduce symptoms of depression and anxiety.',
            ),
            _buildRecommendationCard(
              'Do Something Creative',
              'Draw, paint, write, or play music. Engaging in creative activities can help reduce stress and promote relaxation.',
            ),
            _buildRecommendationCard(
              'Practice Mindfulness',
              'Take a few minutes to focus on the present moment. Pay attention to your thoughts and feelings without judgement. You can do this while sitting, walking, or doing any other activity.',
            ),
            _buildRecommendationCard(
              'Get Enough Sleep',
              'Make sure you are getting enough sleep each night. Lack of sleep can contribute to feelings of anxiety and depression.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationCard(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
