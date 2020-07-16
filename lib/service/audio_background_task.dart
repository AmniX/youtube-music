import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class BackgroundYoutubePlayer extends BackgroundAudioTask {
  AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void onStart(Map<String, dynamic> params) {
    // TODO: implement onStart
    super.onStart(params);
  }

  @override
  void onPlay() {
    _audioPlayer.play();
    super.onPlay();
    AudioServiceBackground.setState(controls: null, processingState: null, playing: true);
  }

  @override
  Future<void> onStop() async {
    await _audioPlayer.stop();
    await _audioPlayer.dispose();
    return await super.onStop();
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}
