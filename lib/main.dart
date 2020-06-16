import 'package:flutter/material.dart';
import 'package:music/ui/splash/splash.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: themeColorSwatch[700]));
    imageCache.clear();

    return MaterialApp(
      theme: ThemeData(
          primarySwatch: themeColorSwatch,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          canvasColor: Colors.transparent),
      home: Material(
        child: SplashScreen(),
      ),
    );
  }
}
