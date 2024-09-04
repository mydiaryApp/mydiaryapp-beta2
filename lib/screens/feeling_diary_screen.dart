import 'package:flutter/material.dart';

class FeelingDiaryScreen extends StatefulWidget {
  @override
  _FeelingDiaryScreenState createState() => _FeelingDiaryScreenState();
}

class _FeelingDiaryScreenState extends State<FeelingDiaryScreen> {
  final TextEditingController _noteController = TextEditingController();

  void _saveNote() {
    final note = _noteController.text;
    if (note.isNotEmpty) {
      // Save the note logic (e.g., saving to local storage or a database)
      print('Note Saved: $note');
      _noteController.clear();
      // Show a success message or feedback to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Note saved successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feeling Diary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saturday -\nJuly 20, 2024',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle the "All notes" action
                },
                child: Text('All notes'),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Make a note',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.mic),
                        onPressed: () {
                          // Handle voice note action
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.bookmark_border),
                        onPressed: () {
                          // Handle bookmark action
                        },
                      ),
                    ],
                  ),
                  TextField(
                    controller: _noteController,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: 'Write here about all your feelings today',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: _saveNote,
                      child: Text('Save'),
                    ),
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
