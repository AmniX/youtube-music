import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/blocs/home/home_bloc.dart';
import 'package:music/data/models/youtube_search_response.dart';
import 'package:music/ui/dashboard/home/ui/vertical_tem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  final Function(Items) _playSong;

  HomeView(this._playSong);

  @override
  _HomeViewState createState() => _HomeViewState(_playSong);
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin<HomeView> {
  final _homeBloc = HomeBloc();
  final _emptyContainer = Container();
  final Function(Items) _playSong;

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
          _homeBloc
              .add(GetHomeData(["New Songs", "2020 Hits", "Popular Songs"]));
          return _emptyContainer;
        } else if (state is HomeStateLoading) {
          return Center(
            child: CircularProgressIndicator(),
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
        }
        return _emptyContainer;
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
