import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/constants.dart';

import 'package:flutter/services.dart';
import 'package:music/ui/players/small_player.dart';
import 'home/ui/home.dart';
import 'hotlist/hotlist.dart';
import 'library/library.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _smallPlayerHeight = MediaQuery.of(context).size.height * 0.1;
    final _smallPlayer = SmallPlayer(_smallPlayerHeight, null);

    final Function(Video) _playSong = (item) {
        _smallPlayer.syncWithVideo(item);
    };
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomSheet: _smallPlayer,
          appBar: AppBar(
            bottom: TabBar(
              labelColor: Colors.red,
              unselectedLabelColor: textColorDark,
              indicatorWeight: 4,
              indicatorColor: themeColorSwatch,
              indicatorPadding: EdgeInsets.only(left: 36, right: 36),
              tabs: [
                Tab(
                  icon: Text(
                    "Home",
                  ),
                ),
                Tab(
                  icon: Text(
                    "Hotlist",
                  ),
                ),
                Tab(
                  icon: Text(
                    "Library",
                  ),
                )
              ],
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                Image.asset(
                  "assets/logo/logo.png",
                  scale: 14,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    "Music",
                    style: TextStyle(color: textColorDark),
                  ),
                )
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.cast,
                  color: Colors.black87,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.black87,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black87,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Divider(
                  color: Colors.grey,
                  height: 1.5,
                  thickness: 2,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: _smallPlayerHeight),
                child: TabBarView(
                  children: [
                    HomeView(_playSong),
                    HotListView(_playSong),
                    LibraryView(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
