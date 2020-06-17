import 'package:flutter/material.dart';
import 'package:music/constants.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class HorizontalListHomeItem extends StatelessWidget {
  final Video _video;
  final Function(Video) _playSong;

  HorizontalListHomeItem(this._video, this._playSong);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _playSong(_video),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              borderOnForeground: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(_video.thumbnails.mediumResUrl,
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
                    _video.title,
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: textColorDark),
                  ),
                ),
                SizedBox(
                  width: home_image_size,
                  height: 40,
                  child: Text(
                    _video.description,
                    maxLines: 3,
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
