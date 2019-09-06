import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {

    @override
    Widget build (BuildContext ctxt) {
      return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>
                  [
                    GestureDetector(
                      onTap: () {
                        _launchURL('http://www.github.com');
                      },
                      child: Image.asset('assets/images/github.png',
                        width: 30,
                        height: 30,
                        ),
                    ),
                    
                    GestureDetector(
                      onTap: () {
                        _launchURL('http://www.twitter.com');
                      },
                      child: 
                        Image.asset('assets/images/twitter.png',
                        width: 30,
                        height: 30)
                    ),

                  ]
                );
             
  }

  _launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

}