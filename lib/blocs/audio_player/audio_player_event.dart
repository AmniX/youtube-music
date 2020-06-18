part of 'audio_player_bloc.dart';

@immutable
abstract class AudioPlayerEvent {}

class PlayAudioEvent extends AudioPlayerEvent {
  final Video video;

  PlayAudioEvent(this.video);
}

class PauseAudioEvent extends AudioPlayerEvent {
  final Video video;

  PauseAudioEvent(this.video);
}

class StopAudioEvent extends AudioPlayerEvent {}
