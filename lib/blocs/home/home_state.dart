part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateLoaded extends HomeState {
  List<Pair<String, YoutubeSearchResponse>> homePageResponses;

  HomeStateLoaded(this.homePageResponses);
}