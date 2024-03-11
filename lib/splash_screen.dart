import 'dart:async';

import 'package:chat_bot/chat_screen.dart';
import 'package:chat_bot/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => ChatProvider(),
              child: ChatScreen(),
            ),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            child: Image.asset(
              'assets/images/ic_logo.png',
              width: 100,
              height: 100,
            )),
      ),
    );
  }
}
