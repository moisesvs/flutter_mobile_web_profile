import 'package:flutter/material.dart';

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
                                        Image.asset('assets/images/github.png',
                                            width: 30,
                                            height: 30),
                                        
                                        Image.asset('assets/images/twitter.png',
                                            width: 30,
                                            height: 30)

                                      ]
              )
          )
      );     
  }

}