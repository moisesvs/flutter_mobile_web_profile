// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:flutterMobileWeb/bloc/post/ProfileBloc.dart';
import 'package:flutterMobileWeb/bloc/post/ProfileState.dart';
import 'package:flutterMobileWeb/repository/ProfileRepository.dart';
import 'package:flutterMobileWeb/widgets/Footer.dart';
import 'package:flutterMobileWeb/widgets/Header.dart';
import 'bloc/post/ProfileEvent.dart';
import 'widgets/Body.dart';
import 'widgets/AppDrawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  MyApp();

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  final ProfileRepository _profileRepository = ProfileRepository();
  ProfileBloc _profileBloc;

  @override
  void initState() {
    super.initState();
    _profileBloc = ProfileBloc(profileRepository: _profileRepository);
    _profileBloc.add(LoadingPostEvent());
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => _profileBloc,
      child: MaterialApp(
                  theme: ThemeData (
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
                        
                  home: BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (_, state) {
                          Widget body;
                          Widget header = new Header();
                          Widget footer = new Footer();
                          if (state is ProfileLoaded) {
                            body = new BodyHome(profile: state.profile);
                          } else if (state is ProfileError)  {
                            body = new BodyError();
                          } else {
                            body = new BodyLoading();
                          }
                          
                          return  Scaffold (
                                resizeToAvoidBottomPadding: false,
                                backgroundColor: Colors.white,
                                drawer: const AppDrawer(
                                        permanentlyDisplay: true,
                                      ),
                                body:

                                  Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: SingleChildScrollView(child:Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            header,
                                            body
                                        ]
                                      )
                                    )
                                  ),

                                bottomNavigationBar: footer
                          );

                      },
                  ),
              )
    );
  }

  @override
  void dispose() {
    _profileBloc.close();
    super.dispose();
  }
}