import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaylistsPage extends StatelessWidget {
  final List<Map<String, String>> _playlists = [
    {
      'name': 'Relaxing Music',
      'link': 'https://open.spotify.com/artist/7vgzPGibRcse3QY4d9316n'
    },
    {
      'name': 'Peaceful Piano',
      'link': 'https://open.spotify.com/playlist/37i9dQZF1DX4sWSpwq3LiO'
    },
    {
      'name': 'Ambient Relaxation',
      'link': 'https://open.spotify.com/playlist/37i9dQZF1DX3Ogo9pFvBkY'
    },
    {
      'name': 'Deep Focus',
      'link': 'https://open.spotify.com/playlist/37i9dQZF1DWZeKCadgRdKQ'
    },
    {
      'name': 'Calm Vibes',
      'link': 'https://open.spotify.com/playlist/37i9dQZF1DX1s9knjP51Oa'
    },
    {
      'name': 'Peaceful Meditation',
      'link': 'https://open.spotify.com/playlist/37i9dQZF1DWZqd5JICZI0u'
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
          "Calming Music",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26.0),
        ),
        backgroundColor: Colors.purple[400],
        elevation: 0.0,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.all(10),
        children: _playlists
            .map((playlist) => ElevatedButton(
                  onPressed: () async {
                    if (await canLaunchUrl(Uri.parse(playlist['link']!))) {
                      await launchUrl(Uri.parse(playlist['link']!));
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        playlist['name']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        playlist['link']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple[400],
                    minimumSize: Size(0, 150),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
