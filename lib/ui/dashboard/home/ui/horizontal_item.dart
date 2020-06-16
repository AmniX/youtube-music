import 'package:flutter/material.dart';
import 'package:music/data/models/youtube_search_response.dart';
import 'package:music/constants.dart';

class HorizontalListHomeItem extends StatelessWidget {
  final Items youtubeItem;
  final Function(Items) _playSong;

  HorizontalListHomeItem(this.youtubeItem, this._playSong);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _playSong(youtubeItem),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              borderOnForeground: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                youtubeItem.snippet.thumbnails.medium.url,
                fit: BoxFit.cover,
                width: home_image_size,
                height: home_image_size,
              )),
          Padding(
            padding: EdgeInsets.only(top: 4, left: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: home_image_size,
                  child: Text(
                    youtubeItem.snippet.title,
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: textColorDark),
                  ),
                ),
                SizedBox(
                  width: home_image_size,
                  height: 40,
                  child: Text(
                    youtubeItem.snippet.description,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: textColorDark),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
