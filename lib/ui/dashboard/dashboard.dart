import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:music/constants.dart';
import 'package:music/ui/dashboard/home/home.dart';
import 'file:///C:/Users/amant/StudioProjects/flutter_youtube_music/lib/ui/dashboard/hotlist/hotlist.dart';
import 'file:///C:/Users/amant/StudioProjects/flutter_youtube_music/lib/ui/dashboard/library/library.dart';

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
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
                      HomeView(),
                      HotListView(),
                      LibraryView(),
                    ],
                  )
                ],
              ),
            )));
  }
}
