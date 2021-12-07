import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MaterialApp(
  home: Bird(),
));


class Bird extends StatefulWidget {
  const Bird({
    Key? key
  }) : super(key: key);

  @override
  State<Bird> createState() => _BirdState();
}

class _BirdState extends State<Bird> {

  AudioCache cache = AudioCache(); // you have this
  AudioPlayer player = AudioPlayer(); // create this
  String path = "bones.mp3";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeah"),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  _playFile();
                },
                child: Text("Music !")),
            ElevatedButton(
                onPressed: () {
                  _stopFile();
                },
                child: Text("Stop !")),
          ],
        )
      ),
      );
  }

  void _playFile() async{
    player = await cache.play(path);
  }

  void _stopFile() {
    player.stop();
  }
}