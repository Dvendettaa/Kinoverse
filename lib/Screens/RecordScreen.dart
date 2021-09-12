import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kinoverse/api/audio_player.dart';
import 'package:kinoverse/api/sound_player.dart';
import 'package:kinoverse/api/sound_recorder.dart';


import '../pallete.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({Key? key}) : super(key: key);

  static const String id = 'RecordScreen';

  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {

  final recorder = SoundRecorder();
  final player = SoundPlayer();
  final MPlayer = MusicPlayer();

  @override
  void initState() {
    super.initState();


    recorder.init();
    player.init();
    MPlayer.init();
  }

  @override
  void dispose() {

    recorder.dispose();
    player.dispose();
    MPlayer.dispose();

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final isRecording = recorder.isRecording;
    final RecIcon = isRecording? Icons.stop : Icons.mic;
    final RecText = isRecording? "STOP" : "START";
    final primary = isRecording? Colors.red : Colors.white;
    final onPrimary = isRecording? Colors.white : Colors.black;

    final isPlaying = player.isPlaying;
    final AudIcon = isPlaying? Icons.stop : Icons.play_arrow;
    final AudText = isPlaying? "Stop Playing" : "Play Recording";
    final Audprimary = isPlaying? Colors.red : Colors.white;
    final AudonPrimary = isPlaying? Colors.white : Colors.black;

    final isMPlaying = MPlayer.isPlaying;
    final mIcon = isMPlaying? Icons.pause : Icons.play_arrow;
    final mText = isMPlaying? "Pause Music" : "Play Music";
    final Mprimary = isMPlaying? mainRed : Colors.black;
    final MonPrimary = isMPlaying? Colors.white : Colors.white;


    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Recording room'),
        backgroundColor: mainRed,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: () async{
                  final isRecording = await recorder.toggleRecording();
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(175,50),
                  primary: primary,
                  onPrimary: onPrimary
                ),
                icon: Icon(RecIcon),
                label: Text(
                    RecText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                )
            ),
            SizedBox(height:20),
            ElevatedButton.icon(
                onPressed: () async{
                  await player.togglePlaying(() {setState(() {});});
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(175,50),
                    primary: Audprimary,
                    onPrimary: AudonPrimary
                ),
                icon: Icon(AudIcon),
                label: Text(
                  AudText,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                )
            ),
            SizedBox(height:50),
            ElevatedButton.icon(
                onPressed: () async{
                  await MPlayer.togglePlaying();
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(175,50),
                    primary: Mprimary,
                    onPrimary: MonPrimary
                ),
                icon: Icon(mIcon),
                label: Text(
                  mText,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                )
            ),
          ],
        )
      ),
    );
  }
}