part of 'hotlist_bloc.dart';

@immutable
abstract class HotlistState {}

class HotlistStateInitial extends HotlistState {}

class HotlistStateLoading extends HotlistState {}

class HotlistStateError extends HotlistState {
  final Exception e;
  final StackTrace stackTrace;
  HotlistStateError(this.e, this.stackTrace);
}

class HotlistStateLoaded extends HotlistState {
  final List<Video> hotlistPageResponses;
  HotlistStateLoaded(this.hotlistPageResponses);
}
