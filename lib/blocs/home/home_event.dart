part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetHomeData extends HomeEvent {
  final List queriesArray;

  GetHomeData(this.queriesArray);
}
