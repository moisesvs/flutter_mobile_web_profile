import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {

    @override
    Widget build (BuildContext ctxt) {
      return 
      BottomAppBar(
        color: Colors.white,
        child:
          Padding (
                  padding: EdgeInsets.only( top: 10.0, 
                                            left: 100.0, 
                                            right: 100.0, 
                                            bottom: 15.0),
                                            child:
                                Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>
                                      [ 
                                        GestureDetector(
                                          onTap: () => launchUrl("https://github.com/moisesvs"), // handle your image tap here
                                          child: 
                                              Image.asset('assets/images/github.png',
                                                  width: 30,
                                                  height: 30),
                                        ),

                                        GestureDetector(
                                          onTap: () => launchUrl("https://twitter.com/moisesvs"), // handle your image tap here
                                          child: 
                                              Image.asset('assets/images/twitter.png',
                                                  width: 30,
                                                  height: 30)
                                        
                                        ),


                                      ]
              )
          )
      );     
  }

  void launchUrl (String url) async {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  }

}