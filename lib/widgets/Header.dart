import 'package:flutter/material.dart';

class Header extends StatelessWidget {

    @override
    Widget build (BuildContext ctxt) {
      return

            Padding (
              padding: EdgeInsets.only( top: 60.0, 
                                        left: 15.0, 
                                        right: 15.0, 
                                        bottom: 35.0),
              child: 
                Wrap(
                  direction: Axis.horizontal, // main axis (rows or columns)
                  children: <Widget>[
                  Text ("moisesvazquez.com",
                      style: TextStyle( fontWeight: FontWeight.bold, 
                                color: Colors.black, 
                                fontSize: 40
                                )            
                  ),
                  Text ("'s blog",
                      style: TextStyle( fontWeight: FontWeight.bold, 
                                color: Colors.grey, 
                                fontSize: 40
                      )            
                  )]
                )
          );
    }

}