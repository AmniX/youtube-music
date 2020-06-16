import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/amant/StudioProjects/flutter_youtube_music/lib/ui/dashboard/home/ui/vertical_tem.dart';
import 'package:dio/dio.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      itemCount: 3,
      itemBuilder: (BuildContext ctx, int pos) {
        switch (pos) {
          case 0:
            return VerticalListHomeItem("New Music");
          case 1:
            return VerticalListHomeItem("New Launches");
          case 2:
            return VerticalListHomeItem("People Listening Nearby");
          default:
            return Text("Empty Data");
        }
      },
    );
  }
}
