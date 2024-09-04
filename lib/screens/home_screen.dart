import 'dart:math'; // Import for random number generation
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'feeling_diary_screen.dart'; // Import the Feeling Diary screen
import 'chatbot_screen.dart'; // Import the Chatbot screen
import 'profile_screen.dart'; // Import the Profile screen
import 'music_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _showYoutubeVideo = true; // Flag to toggle content

  @override
  void initState() {
    super.initState();
    _chooseContent(); // Choose content type on initialization
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Home screen is already displayed, no need to do anything
        break;
      case 1:
        Navigator.pushNamed(context, '/feelingDiary'); // Navigate to Feeling Diary screen
        break;
      case 2:
        Navigator.pushNamed(context, '/chatbot'); // Navigate to Chatbot screen
        break;
      case 3:
        Navigator.pushNamed(context, '/music'); // Navigate to Music screen
        break;
      case 4:
        Navigator.pushNamed(context, '/profile'); // Navigate to Profile screen
        break;
    }
  }

  Future<void> _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _chooseContent() {
    // Randomly choose between YouTube video and recent watch content
    setState(() {
      _showYoutubeVideo = Random().nextBool();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0xFFF0F4FF), // Light blue background for the top section
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Hi Fathima!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.pink.shade100,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'how are you feeling today?',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Keep\nYour Mind\nClear',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white, // White background for the main content
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Text(
                        'Today overview',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: _buildOverviewCard(
                                'Sleeping Time',
                                '07h 25m',
                                Colors.lightGreen.shade100,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: _buildOverviewCard(
                                'Mood and Emotions',
                                'Happy',
                                Colors.pink.shade100,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: _buildOverviewCard(
                                'Stress Level',
                                '2\nLow',
                                Colors.lightBlue.shade100,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/feelingDiary'); // Navigate to Feeling Diary screen
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Feeling Diary',
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                              Icon(Icons.edit, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/meditationTips'); // Navigate to Meditation Tips screen
                        },
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.shade100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.mic, color: Colors.black),
                              SizedBox(width: 8),
                              Text('Meditation'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      _showYoutubeVideo
                          ? GestureDetector(
                              onTap: () {
                                _launchURL('https://www.youtube.com/watch?v=dQw4w9WgXcQ'); // Replace with the actual URL
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  'https://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg', // Replace with the actual thumbnail URL
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Recent Watch Content',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  // Add recent watch content here
                                  Text('No recent content available.'),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: _buildNavItem(Icons.home, 0),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem(Icons.chat_bubble_outline, 1),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem(Icons.headset, 2),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem(Icons.person_outline, 3),
              label: '',
            ),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent, // Set to transparent so it shows the container color
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.grey.shade800,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: isSelected ? Colors.black : Colors.grey,
      ),
    );
  }

  Widget _buildOverviewCard(String title, String value, Color color) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    routes: {
      '/home' : (context) => HomeScreen(),
      '/chatbot': (context) => ChatScreen(),
      '/music': (context) => MusicScreen(),
      '/profile': (context) => ProfileScreen(),
     
      // Add other routes here
    },
  ));
}
