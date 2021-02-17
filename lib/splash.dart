import 'dart:async';

import 'package:flutter/material.dart';

import 'in_app_webiew_example.screen.dart';
// import 'package:permission_handler/permission_handler.dart';

// InAppLocalhostServer localhostServer = new InAppLocalhostServer();

class SplashScreen extends StatefulWidget {
  final bool isLogged = false;

  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InAppWebViewExampleScreen()),
            ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage(
        'assets/images/Splash_Screen_2.png'); //<- Creates an object that fetches an image.
    var image = new Image(
        image: assetsImage,
        fit: BoxFit.fill,
        height: double.infinity); //<- Creates a widget that displays an image.

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /* appBar: AppBar(
          title: Text("MyApp"),
          backgroundColor:
              Colors.blue, //<- background color to combine with the picture :-)
        ),*/
        body: Container(
          decoration: new BoxDecoration(color: Colors.white),
          child: new Center(
            child: image,
          ),
        ), //<- place where the image appears
      ),
    );
  }
}
