import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as YTExplode;
import 'package:music/constants.dart';
import 'package:intl/intl.dart';

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
                  _buildThumbnail(_video.thumbnails.mediumResUrl),
                  _buildPlayIcon(),
                  _buildText(
                      _video.title, _video.author, _video.engagement.viewCount)
                ],
              )),
        ));
  }

  _buildThumbnail(thumbnailUrl) {
    return Container(
      width: double.infinity,
      height: home_image_size,
      child: Card(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          borderOnForeground: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.network(
            thumbnailUrl,
            fit: BoxFit.cover,
          )),
    );
  }

  _buildText(title, artist, views) {
    return Padding(
      padding: EdgeInsets.only(left: 20, bottom: 20),
      child: Column(
          verticalDirection: VerticalDirection.up,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("$artist - ${_getFormattedViews(views)} views",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14)),
            SizedBox(height: 5),
            Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18))
          ]),
    );
  }

  _buildPlayIcon() {
    return Center(
        child: Icon(
      Icons.play_arrow,
      color: Colors.white,
      size: hotlist_icon_size,
      semanticLabel: 'Play',
    ));
  }

  _getFormattedViews(viewsCount) {
    return NumberFormat.compact(locale: 'en').format(viewsCount);
  }
}
