import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kinoverse/Screens/IntroductionScreen.dart';

import 'Screens/LoadingScreen.dart';
import 'Screens/NoNetwork.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KinoVerse',
        theme: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
          ).apply(
            bodyColor: Colors.white,
            displayColor: Colors.blue,
          ),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoadingScreen(),
          NoNetworkScreen.id: (context) => NoNetworkScreen(),
          IntroductionScreen.id: (context) => IntroductionScreen(),
        }
    );
  }
}
