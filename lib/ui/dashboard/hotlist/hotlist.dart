import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/blocs/hotlist/hotlist_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/constants.dart';
import 'package:music/ui/dashboard/hotlist/hotlist_item.dart';

class HotListView extends StatefulWidget {
  final Function(String) _playSong;

  HotListView(this._playSong);

  @override
  State<StatefulWidget> createState() => _HotListViewState(_playSong);
}

class _HotListViewState extends State<HotListView>
    with AutomaticKeepAliveClientMixin<HotListView> {
  final _hotListBloc = HotlistBloc();

  final Function(String) _playSong;

  _HotListViewState(this._playSong);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotlistBloc, HotlistState>(
      bloc: _hotListBloc,
      builder: (context, HotlistState state) {
        switch (state.runtimeType) {
          case HotlistStateInitial:
            _hotListBloc.add(GetHotlistData());
            return _buildDefaultView();
          case HotlistStateError:
            return _buildErrorView();
          case HotlistStateLoading:
            return _buildLoadingView();
          case HotlistStateLoaded:
            return _buildHotlistView(
                (state as HotlistStateLoaded).hotlistPageResponses);
          default:
            return _buildDefaultView();
        }
      },
    );
  }

  _buildDefaultView() {
    return Container();
  }

  _buildErrorView() {
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
            onPressed: () => {_hotListBloc.add(GetHotlistData())},
          ),
        )
      ],
    );
  }

  _buildLoadingView() {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 4,
        valueColor: AlwaysStoppedAnimation<Color>(themeColorSwatch),
      ),
    );
  }

  _buildHotlistView(videos) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, top: 32),
            child: Text("TOP VIDEOS",
                style: TextStyle(
                    color: textColorDark, fontWeight: FontWeight.bold)),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: videos.length,
                  itemBuilder: (context, position) {
                    return HotListItem(videos[position], _playSong);
                  }))
        ]);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _hotListBloc.close();
    super.dispose();
  }
}
