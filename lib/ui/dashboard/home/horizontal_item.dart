import 'package:flutter/material.dart';
import 'package:music/utils/utils.dart';

import '../../../constants.dart';

class HorizontalListHomeItem extends StatelessWidget {
  String _title;

  HorizontalListHomeItem(this._title);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            borderOnForeground: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network(
              "https://picsum.photos/id/"+nextRandomInt(1, 500).toString()+"/200/300",
              fit: BoxFit.cover,
              width: home_image_size,
              height: home_image_size,
            )),
        Padding(
          padding: EdgeInsets.only(top: 4, left: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title",
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: textColorDark),
              ),
              Text(
                "Description",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: textColorDark),
              )
            ],
          ),
        )
      ],
    );
  }
}
