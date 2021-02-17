import 'package:flutter/material.dart';
import 'package:remontada/splash.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  await Permission.camera.request();
//  await Permission.storage.request();
  // await localhostServer.start();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            theme: ThemeData(fontFamily: 'Alhadari'),
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => SplashScreen(),
            });
  }
}
