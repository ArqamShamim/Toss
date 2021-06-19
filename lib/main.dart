import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AppPage(),
        backgroundColor: Colors.redAccent[100],
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'Toss',
            style: TextStyle(
                fontFamily: 'Courgette', color: Colors.white, fontSize: 25.0),
          ),
        ),
      ),
    );
  }
}

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int diceNum = 1;
  int coinNum = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('images/dice$diceNum.png'),
              )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                      onPressed: () {
                        final player = AudioCache();
                        player.play('note1.wav');
                        setState(() {
                          diceNum = Random().nextInt(6) + 1;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        'Roll dice',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      )),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('images/coin$coinNum.png'),
              )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                      onPressed: () {
                        final player = AudioCache();
                        player.play('note7.wav');
                        setState(() {
                          coinNum = Random().nextInt(2) + 1;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        'Toss coin',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
