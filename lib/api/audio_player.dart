import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';

class MusicPlayer {
  late AudioPlayer _audioPlayer;

  bool _isPaused = false;

  bool get isPlaying => _isPaused;


  Future init() async{
    _audioPlayer = AudioPlayer();
  }

  Future dispose() async{
    _audioPlayer.dispose();
  }

  Future _play() async{
    int result = await _audioPlayer.play('https://luan.xyz/files/audio/ambient_c_motion.mp3',isLocal: false,);
    if (result == 1) {
      log('Sound played Successfully!');
    }
  }

  Future _pause() async{
    await _audioPlayer.pause();
  }

  Future togglePlaying() async{
    if(_isPaused){
      await _pause();
      _isPaused = !_isPaused;
    }else{
      await _play();
      _isPaused = !_isPaused;
    }
  }
}