import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

class MainHomeCaantroller extends GetxController
{
  RxDouble i = 1.0.obs;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  void initSong() {
    assetsAudioPlayer.open(Audio("assets/music/bgmusic.mp3"),
      autoStart: true, showNotification: false,loopMode: LoopMode.single);
  }
  void volume()
  {
    i.value==1?i.value=0.0:i.value=1.0;
    assetsAudioPlayer.setVolume(i.value);
  }
}