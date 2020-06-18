import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/blocs/home/home_bloc.dart';
import 'package:music/constants.dart';
import 'package:music/ui/dashboard/home/ui/vertical_tem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' hide Container;

class HomeView extends StatefulWidget {
  final Function(Video) _playSong;

  HomeView(this._playSong);

  @override
  _HomeViewState createState() => _HomeViewState(_playSong);
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin<HomeView> {
  final _homeBloc = HomeBloc();
  final _emptyContainer = Container();
  final Function(Video) _playSong;
  final _homeQueries = ["New Songs", "2020 Hits", "Popular Songs"];

  _HomeViewState(this._playSong);

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _homeBloc,
      builder: (BuildContext context, HomeState state) {
        if (state is HomeStateInitial) {
          _homeBloc.add(GetHomeData(_homeQueries));
          return _emptyContainer;
        } else if (state is HomeStateLoading) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 4,
              valueColor: AlwaysStoppedAnimation<Color>(themeColorSwatch),
            ),
          );
        } else if (state is HomeStateLoaded) {
          return ListView.builder(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            itemCount: state.homePageResponses.length,
            itemBuilder: (BuildContext ctx, int pos) {
              final data = state.homePageResponses[pos];
              return VerticalListHomeItem(data.first, data.second, _playSong);
            },
          );
        } else if (state is HomeStateError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Icon(
                  Icons.error_outline,
                  size: 72,
                  color: Colors.red,
                ),
              ),
              Text(
                "Oops! Something went wrong!",
                maxLines: 8,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RaisedButton(
                  child: Text("Retry"),
                  onPressed: () => {_homeBloc.add(GetHomeData(_homeQueries))},
                ),
              )
            ],
          );
        }
        return _emptyContainer;
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
