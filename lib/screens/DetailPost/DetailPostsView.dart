// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterMobileWeb/data/PostFeed.dart';
import 'package:flutterMobileWeb/widgets/Footer.dart';

class DetailsPostsView extends StatelessWidget {

  static const routeName = '/detailsPost';

  PostFeed post;

  DetailsPostsView();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final DetailsPostsArguments args = ModalRoute.of(context).settings.arguments;
    post = args.postFeed;

    return MaterialApp (
      
        theme: ThemeData(
                // Define the default Brightness and Colors
                brightness: Brightness.dark, 
                primaryColor: Colors.grey,
                accentColor: Colors.grey,
                
                // Define the default Font Family
                fontFamily: 'Inter',

                // Define the default TextTheme. Use this to specify the default
                // text styling for headlines, titles, bodies of text, and more.
                textTheme: TextTheme(
                  headline: TextStyle(fontSize: 72.0),
                  title: TextStyle(fontSize: 70.0),
                  body1: TextStyle(
                              fontSize: 14.0),
                ),
              ),
        home:  
            new Builder(builder: (BuildContext context){
              Widget footer = Footer();

              return Scaffold (
                      appBar: AppBar(
                        title: Text(post.title), 
                        backgroundColor: Colors.white
                        ),
                      resizeToAvoidBottomPadding: false,
                      backgroundColor: Colors.white,
                      body:

                        Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: double.infinity,
                            child: SingleChildScrollView(child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text(post.title, 
                                      style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey)
                                  )
                              ]
                            )
                          )
                        ),

                      bottomNavigationBar: footer
                );
        })
    );
  }
}

class DetailsPostsArguments {
  final PostFeed postFeed;

  DetailsPostsArguments(this.postFeed);
}