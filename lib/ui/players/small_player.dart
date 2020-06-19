import 'package:music/blocs/audio_player/audio_player_bloc.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' hide Container;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/blocs/audio_player/audio_player_bloc.dart';

class SmallPlayer extends StatefulWidget {
  // ignore: close_sinks

  final double _height;
  _SmallPlayerState _smallPlayerState;

  SmallPlayer(this._height);

  @override
  _SmallPlayerState createState(){
    final result = _SmallPlayerState();
    _smallPlayerState = result;
    return result;
  }

  void syncWithVideo(Video newVideo) {
    _smallPlayerState.syncWithVideo(newVideo);
  }
}

class _SmallPlayerState extends State<SmallPlayer> {
  final _audioPlayerBloc = AudioPlayerBloc();
  var _progress = 0.1;


  void syncWithVideo(Video newVideo){
    _audioPlayerBloc?.add(PlayAudioEvent(newVideo));
  }

  @override
  void dispose() {
    _audioPlayerBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                0), // TODO: Corner Radius to be > 0 for Sexy Curves
          ),
        ),
      ),
      height: widget._height,
      child: BlocBuilder(
        bloc: _audioPlayerBloc,
        builder: (BuildContext ctx, AudioPlayerState state) {
          if (state is InitialAudioPlayerState) {
            return Container(
              color: Colors.black,
            );
          } else if (state is LoadingAudioPlayerState) {
            return Container(child: CircularProgressIndicator());
          } else if (state is LoadedAudioPlayerState) {
            return Column(
              children: [
                Divider(
                  color: Colors.grey,
                  thickness: 3,
                  indent: MediaQuery.of(context).size.width * 0.45,
                  endIndent: MediaQuery.of(context).size.width * 0.45,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    child: Row(
                      children: [
                        Card(

                          child: Image.network(state.src.thumbnails.lowResUrl),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 2.0),
                                child: Text(
                                  state.src.title,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 2.0),
                                child: Text(
                                  state.src.description,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(
                            Icons.play_arrow,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(
                            Icons.fast_forward,
                            size: 32,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    value: _progress,
                  ),
                )
              ],
            );
          } else {
            return Container(child: Text(state.runtimeType.toString()));
          }
        },
      ),
    );
  }
}
