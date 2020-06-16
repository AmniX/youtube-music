import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/constants.dart';

import 'package:flutter/services.dart';
import 'package:music/ui/dashboard/player/player_bottom_sheet.dart';
import 'package:music/utils/lazy.dart';
import 'home/ui/home.dart';
import 'hotlist/hotlist.dart';
import 'library/library.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var showSmallPlayer = false;

  @override
  Widget build(BuildContext context) {
    final Function(String) _playSong = (item) {
      if (showSmallPlayer == false)
        setState(() {
          showSmallPlayer = true;
        });
    };
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
    return MaterialApp(
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        bottomSheet: showSmallPlayer
            ? Container(
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            topLeft: Radius.circular(16)))),
              )
            : null,
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
            TabBarView(
              children: [
                HomeView(_playSong),
                HotListView(),
                LibraryView(),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
