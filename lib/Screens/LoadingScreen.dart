import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kinoverse/Screens/IntroductionScreen.dart';
import 'package:kinoverse/Services/SharedInformation_Services.dart';
import 'package:kinoverse/pallete.dart';
import 'package:lottie/lottie.dart';

import 'NoNetwork.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  String navigator = IntroductionScreen.id;

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  Future checkConnection() async {
    try {
      var _result = await (Connectivity().checkConnectivity());

      if (_result == ConnectivityResult.mobile ||
          _result == ConnectivityResult.wifi) {
        await Firebase.initializeApp();


        bool? _isUser = await SharedInformation().isLoggedIn();

        if (_isUser!) {
          setState(() async {
            //navigator = DashBoard.id;
          });
        }
      }else {
        Navigator.pushReplacementNamed(context, NoNetworkScreen.id);

        log('no connection');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainRed,
      body: Center(
        child: Lottie.asset(
            'assets/loading.json',
            fit: BoxFit.cover,
            alignment: Alignment.center,
            repeat: true,
            onLoaded: (value) async{
              await Future.delayed(Duration(seconds: 3));
              Navigator.pushReplacementNamed(context, navigator);
            }
        ),
      ),
    );
  }
}