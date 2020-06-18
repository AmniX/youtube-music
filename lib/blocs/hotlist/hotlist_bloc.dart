import 'dart:async';

import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hotlist_event.dart';
part 'hotlist_state.dart';

class HotlistBloc extends Bloc<HotlistEvent, HotlistState> {
  final _youtubeExplode = YoutubeExplode();

  @override
  HotlistState get initialState => HotlistStateInitial();

  @override
  Stream<HotlistState> mapEventToState(
    HotlistEvent event,
  ) async* {
    if (event is GetHotlistData) {
      // set state to loading
      yield HotlistStateLoading();

      try {
        // fetch hotlist data
        final _hotlistPageResponse = await _youtubeExplode.search
            .getVideosAsync("Video Hotlist")
            .toList();

        // set state to loaded
        yield HotlistStateLoaded(_hotlistPageResponse);
      } catch (e, stackTracke) {
        // set state to error
        yield HotlistStateError(e, stackTracke);
      }
    }
  }
}
