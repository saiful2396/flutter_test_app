import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:share/share.dart';
import 'dart:async';
import 'dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool button;

  static GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    button = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Flutter Sharing File"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.5,
                child: RaisedButton(
                  color: Colors.blueAccent[100],
                  onPressed: urlFileShare,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: button
                        ? CircularProgressIndicator()
                        : Text(
                            'URL File Share',
                            style: TextStyle(fontSize: 17),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> urlFileShare() async {
    setState(() {
      button = true;
    });
    final RenderBox box = context.findRenderObject();
    if (Platform.isAndroid) {
      Share.share('check out my website https://example.com',
          subject: 'Look what I made!');
    } else {
      Share.share('Hello, check your share files!',
          subject: 'URL File Share',
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
    setState(() {
      button = false;
    });
  }
}
