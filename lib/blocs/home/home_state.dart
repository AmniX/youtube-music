part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateError extends HomeState {
  final Exception e;
  final StackTrace stackTrace;
  HomeStateError(this.e,this.stackTrace);
}

class HomeStateLoaded extends HomeState {
  List<Pair<String, List<Video>>> homePageResponses;

  HomeStateLoaded(this.homePageResponses);
}