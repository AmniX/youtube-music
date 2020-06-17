import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

part 'audio_player_event.dart';

part 'audio_player_state.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  var _youtubeExplode = YoutubeExplode();

  @override
  AudioPlayerState get initialState => InitialAudioPlayerState();

  @override
  Stream<AudioPlayerState> mapEventToState(AudioPlayerEvent event) async* {
    if (event is PlayAudioEvent) {
      yield LoadingAudioPlayerState();
      var streamManifest = await _youtubeExplode.videos.streamsClient
          .getManifest(event.video.id.toString());
      yield LoadedAudioPlayerState(
          event.video, streamManifest.audioOnly.toList());
    } else if (event is PauseAudioEvent) {
      yield PauseAudioPlayerState();
    } else if (event is StopAudioEvent) {
      yield InitialAudioPlayerState();
    }
  }

  @override
  Future<void> close() {
    _youtubeExplode.close();
    return super.close();
  }
}
