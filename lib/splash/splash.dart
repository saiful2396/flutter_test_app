// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 📦 Package imports:
import 'package:avatar_glow/avatar_glow.dart';

// 🌎 Project imports:
import 'package:flutter_test_app/container/containers.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final int delayedAmount = 500;
  AnimationController controller;
  Timer timer;

  @override
  void initState() {
    timer = Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return Containers();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => CheckAuth()));
    });

    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFFF55E18), Color(0xFFF55E18)])),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              AvatarGlow(
                endRadius: 150,
                duration: Duration(seconds: 3),
                glowColor: Colors.white,
                repeat: true,
                repeatPauseDuration: Duration(seconds: 3),
                startDelay: Duration(milliseconds: 500),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/icon.jpg'),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/icons.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
