part of 'audio_player_bloc.dart';

@immutable
abstract class AudioPlayerState {}

class InitialAudioPlayerState extends AudioPlayerState {}

class PauseAudioPlayerState extends AudioPlayerState {}

class LoadingAudioPlayerState extends AudioPlayerState {}

class LoadedAudioPlayerState extends AudioPlayerState {
  final Video _src;
  final List<AudioOnlyStreamInfo> _streams;

  LoadedAudioPlayerState(this._src,this._streams){
    print("Audio Loaded");
    _streams.first.url;
  }
}