import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {

    String url;

    ProfileImage ({url});

    @override
    Widget build (BuildContext ctxt) {
      return

            new Container(
                    width: 190.0,
                    height: 190.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                url)
                        )
                    ));
    }

}