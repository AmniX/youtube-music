import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as YTExplode;
import 'package:music/constants.dart';

class HotListItem extends StatelessWidget {
  final Function(YTExplode.Video) _playSong;
  final YTExplode.Video _video;

  HotListItem(this._video, this._playSong);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _playSong(_video),
        child: Padding(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: SizedBox(
              width: double.infinity,
              height: home_image_size,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: home_image_size,
                    child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        borderOnForeground: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.network(
                          _video.thumbnails.mediumResUrl,
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              )),
        ));
  }
}
