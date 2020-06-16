import 'package:flutter/material.dart';
import 'package:music/constants.dart';
import 'package:music/data/models/youtube_search_response.dart';
import 'package:music/ui/dashboard/home/ui/horizontal_item.dart';

class VerticalListHomeItem extends StatelessWidget {
  String _title;
  YoutubeSearchResponse _youtubeSearchResponse;

  VerticalListHomeItem(this._title, this._youtubeSearchResponse);

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
              itemCount: _youtubeSearchResponse.items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext ctx, int pos) {
                return HorizontalListHomeItem(
                    _youtubeSearchResponse.items[pos]);
              }),
        ),
      )
    ]);
  }
}
