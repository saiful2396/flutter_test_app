import 'package:flutter/material.dart';
import 'package:flutter_test_app/animation.dart';
import 'package:flutter_test_app/share.dart';
import 'feedback.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: FeedBack(),
      home: TransitionsHomePage(),
    );
  }
}