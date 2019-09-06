import 'package:flutter/material.dart';

class Fotter extends StatelessWidget {

    @override
    Widget build (BuildContext ctxt) {
      return Container(
                  decoration: new BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Align( alignment: Alignment.center, 
                                  child: Container (
                                  child: new CircularProgressIndicator()
                                ) 
                  )
              )
      );
    }

}