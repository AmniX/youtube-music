import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music/data/models/youtube_search_response.dart';
import 'package:music/data/remote/youtube_api.dart';
import 'package:music/keys.dart';
import 'package:music/utils/pair.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  YouTubeApi _youTubeApi = YouTubeApi(YOUTUBE_KEY);

  @override
  HomeState get initialState => HomeStateInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetHomeData) {
      yield HomeStateLoading();
      var result = List<Pair<String, YoutubeSearchResponse>>();
      for (var query in event.queriesArray) {
        var tmp = await _youTubeApi.search(query);
        if (tmp.statusCode == 200 && tmp.data != null)
          result.add(Pair(query, YoutubeSearchResponse.fromJson(tmp.data)));
      }
      yield HomeStateLoaded(result);
    }
  }
}
