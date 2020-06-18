import 'package:flutter/material.dart';
import 'package:music/constants.dart';
import 'package:music/ui/dashboard/home/ui/horizontal_item.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VerticalListHomeItem extends StatelessWidget {
  final String _title;
  final List<Video> videos;
  final Function(Video) _playSong;

  VerticalListHomeItem(this._title, this.videos, this._playSong);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(left: 16, top: 32),
        child: Text(_title.toUpperCase(),
            style:
                TextStyle(color: textColorDark, fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: EdgeInsets.only(left: 12, top: 8),
        child: SizedBox(
          height: home_image_size + home_image_size / 2,
          child: ListView.builder(
              itemCount: videos.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext ctx, int pos) {
                return HorizontalListHomeItem(
                    videos[pos], _playSong);
              }),
        ),
      )
    ]);
  }
}
