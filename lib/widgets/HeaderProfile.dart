import 'package:flutter/material.dart';

class HeaderProfile extends StatelessWidget {

    @override
    Widget build (BuildContext ctxt) {
      return

            Padding (
              padding: EdgeInsets.only( top: 50.0, 
                                        left: 15.0, 
                                        right: 15.0, 
                                        bottom: 5.0),
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