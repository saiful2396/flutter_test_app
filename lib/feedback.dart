import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(onPressed: () => _launchURL('xxx@gmail.com', 'Flutter Email Test', 'Hello Flutter'), child: new Text('Send mail'),),
      ),
    );
  }
}
