import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:music/utils/pair.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  var _youtubeExplode = YoutubeExplode();

  @override
  HomeState get initialState => HomeStateInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetHomeData) {
      yield HomeStateLoading();
      try {
        var result = List<Pair<String, List<Video>>>();
        for (var query in event.queriesArray) {
          result.add(Pair(query,
              await _youtubeExplode.search.getVideosAsync(query).toList()));
        }
        yield HomeStateLoaded(result);
      } catch (e, stackTrace) {
        yield HomeStateError(e, stackTrace);
      }
    }
  }

  @override
  Future<void> close() {
    _youtubeExplode.close();
    return super.close();
  }
}
