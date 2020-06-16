import 'package:flutter/material.dart';
import 'package:music/data/models/youtube_search_response.dart';

class PlayerBottomSheet extends StatefulWidget {

  void onNewSongSelected(Items item){
    print(item);
  }

  @override
  _PlayerBottomSheetState createState() => _PlayerBottomSheetState();
}

class _PlayerBottomSheetState extends State<PlayerBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black);
  }
}
