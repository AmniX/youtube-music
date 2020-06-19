part of 'audio_player_bloc.dart';

@immutable
abstract class AudioPlayerState {}

class InitialAudioPlayerState extends AudioPlayerState {}

class PauseAudioPlayerState extends AudioPlayerState {}

class LoadingAudioPlayerState extends AudioPlayerState {}

class LoadedAudioPlayerState extends AudioPlayerState {
  final Video src;
  final List<AudioOnlyStreamInfo> streams;

  LoadedAudioPlayerState(this.src,this.streams){
    print("Audio Loaded");
  }
}