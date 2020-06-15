import 'package:flutter/material.dart';
import 'package:music/constants.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
            alignment: Alignment.center,
            color: themeColorSwatch[700],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo/logo.png",
                  width: 98,
                  height: 98,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Music",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal)),
                )
              ],
            )));
  }
}
