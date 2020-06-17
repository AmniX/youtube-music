import 'package:youtube_explode_dart/youtube_explode_dart.dart' hide Container;
import 'package:flutter/material.dart';

class SmallPlayer extends StatefulWidget {
  final double _height;
  final Video _video;

  SmallPlayer(this._height, this._video);

  @override
  _SmallPlayerState createState() => _SmallPlayerState();
}

class _SmallPlayerState extends State<SmallPlayer> {
  var _progress = 0.1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                0), // TODO: Corner Radius to be > 0 for Sexy Curves
          ),
        ),
      ),
      height: widget._height,
      child: Column(
        children: [
          Divider(
            color: Colors.grey,
            thickness: 3,
            indent: MediaQuery.of(context).size.width * 0.45,
            endIndent: MediaQuery.of(context).size.width * 0.45,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Row(
                children: [
                  Card(
                    child: Icon(
                      Icons.personal_video,
                      size: 42,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 2.0),
                          child: Text(
                            "Flamingo",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 2.0),
                          child: Text(
                            "Kero Kero Bonito",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(
                      Icons.play_arrow,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(
                      Icons.fast_forward,
                      size: 32,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2,
            child: LinearProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              value: _progress,
            ),
          )
        ],
      ),
    );
  }
}
