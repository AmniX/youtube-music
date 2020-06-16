import 'package:flutter/material.dart';

class PlayerBottomSheet extends StatefulWidget {
  void onNewSongSelected(String item) {
    print(item);
  }

  @override
  _PlayerBottomSheetState createState() => _PlayerBottomSheetState();
}

class _PlayerBottomSheetState extends State<PlayerBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DraggableScrollableSheet(
        initialChildSize: 0.08,
        maxChildSize: 0.88,
        minChildSize: 0.08,
        builder: (BuildContext context, ScrollController scrollController) {
          return Material(
            child: Container(
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: 10,
                  itemBuilder: (BuildContext ctx, int index) {
                    return ListTile(
                      title: Text(index.toString()),
                      leading: Icon(Icons.insert_chart),
                    );
                  }),
            ),
          );
        },
      ),
    );
  }
}
