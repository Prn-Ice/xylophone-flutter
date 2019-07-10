import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  void playSong(int songNum) {
    final player = AudioCache();
    player.play('note$songNum.wav');
  }

  Color drumColor = Colors.amber.shade50;

  Widget noteKey({Color myColor, int noteNumber}) {
    return Expanded(
      flex: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: myColor,
          onPressed: () {
            setState(() {
              drumColor = Colors.amber;
            });
            playSong(noteNumber);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: drumColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.pink, Colors.pinkAccent]),
              image: DecorationImage(
                image: AssetImage('assets/images/sticks.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Spacer(
                  flex: 2,
                ),
                noteKey(myColor: Colors.red, noteNumber: 1),
                Spacer(
                  flex: 1,
                ),
                noteKey(myColor: Colors.orange, noteNumber: 2),
                Spacer(
                  flex: 1,
                ),
                noteKey(myColor: Colors.yellow, noteNumber: 3),
                Spacer(
                  flex: 1,
                ),
                noteKey(myColor: Colors.green, noteNumber: 4),
                Spacer(
                  flex: 1,
                ),
                noteKey(myColor: Colors.teal, noteNumber: 5),
                Spacer(
                  flex: 1,
                ),
                noteKey(myColor: Colors.blue, noteNumber: 6),
                Spacer(
                  flex: 1,
                ),
                noteKey(myColor: Colors.purple, noteNumber: 7),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
