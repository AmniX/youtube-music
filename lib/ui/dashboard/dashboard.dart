import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/constants.dart';

import 'package:flutter/services.dart';
import 'package:music/widgets/draggable_bottom_sheet.dart';
import 'home/ui/home.dart';
import 'hotlist/hotlist.dart';
import 'library/library.dart';

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Function(String) _playSong = (item) {};
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
    return MaterialApp(
      home: DraggableBottomSheet(
        backgroundWidget: DefaultTabController(
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
                    HomeView(_playSong),
                    HotListView(),
                    LibraryView(),
                  ],
                )
              ],
            ),
          ),
        ),
        previewChild: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child: Column(
            children: <Widget>[],
          ),
        ),
        expandedChild: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child: Column(
            children: <Widget>[],
          ),
        ),
        minExtent: MediaQuery.of(context).size.height * 0.1,
        maxExtent: MediaQuery.of(context).size.height * 0.88,
        blurBackground: false,
      ),
    );
  }
}
