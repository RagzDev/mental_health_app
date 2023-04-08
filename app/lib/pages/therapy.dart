import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TherapyAI extends StatefulWidget {
  @override
  _TherapyAIState createState() => _TherapyAIState();
}

class _TherapyAIState extends State<TherapyAI> {
  List<String> messages = [];

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "AI Therapy",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 32.0),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.black,
            ),
            onPressed: () async {
              var url = Uri.parse('http://127.0.0.1:5000/clear');
              var response = await http.get(url);

              setState(() {
                messages.clear();
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter message',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () async {
                    String prompt = _textController.text;

                    setState(() {
                      messages.add('You: $prompt');
                    });

                    _textController.clear();

                    var url = Uri.parse('http://127.0.0.1:5000/chat');
                    var response = await http.post(
                      url,
                      headers: {'Content-Type': 'application/json'},
                      body: json.encode({'prompt': prompt}),
                    );

                    var jsonResponse = json.decode(response.body);

                    setState(() {
                      messages.add('AI Therapist: ${jsonResponse['reply']}');
                    });
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
