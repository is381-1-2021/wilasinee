import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DailyMood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Mood'),
        actions: [
          IconButton(
            icon: Icon(Icons.close_outlined),
            tooltip: 'close',
            onPressed: () {
              Navigator.pushNamed(context, '/8');
            },
          ),
        ],
      ),
      body: MoodForm(),
    );
  }
}

class MoodForm extends StatefulWidget {
  @override
  _MoodFormState createState() => _MoodFormState();
}

class _MoodFormState extends State<MoodForm> {
  String? _mood;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: ListView(
      children: [
        Column(
          children: [
            SizedBox(height: 10),
            Text(
              'How was your day?',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => setState(() => _mood = 'Excited'),
                  child: Container(
                    height: 70,
                    width: 70,
                    color: _mood != 'Excited'
                        ? Colors.transparent
                        : Color(0xFF8B82D0),
                    child: Image.asset('assets/excited.png'),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => setState(() => _mood = 'Happy'),
                  child: Container(
                    height: 65,
                    width: 65,
                    color: _mood != 'Happy'
                        ? Colors.transparent
                        : Color(0xFF8B82D0),
                    child: Image.asset('assets/happy.png'),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => setState(() => _mood = 'Sad'),
                  child: Container(
                    height: 65,
                    width: 65,
                    color:
                        _mood != 'Sad' ? Colors.transparent : Color(0xFF8B82D0),
                    child: Image.asset('assets/sad.png'),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => setState(() => _mood = 'Angry'),
                  child: Container(
                    height: 65,
                    width: 65,
                    color: _mood != 'Angry'
                        ? Colors.transparent
                        : Color(0xFF8B82D0),
                    child: Image.asset('assets/angry.png'),
                  ),
                ),
              ],
            ),
            Text('Excited           Happy            Sad             Angry'),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Map<String, dynamic> data = {
                  "mood": _mood,
                  "mood_date": DateTime.now()
                };
                FirebaseFirestore.instance.collection("moodish_mood").add(data);
                Navigator.pop(context);
              },
              child: Text('Done'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF5F478C),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
