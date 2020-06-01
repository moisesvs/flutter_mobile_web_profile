import 'package:flutter/material.dart';
import 'package:flutterMobileWeb/bloc/authentication/AuthenticationBloc.dart';
import 'package:flutterMobileWeb/bloc/authentication/AuthenticationEvent.dart';
import 'package:flutterMobileWeb/bloc/authentication/AuthenticationState.dart';
import 'package:flutterMobileWeb/bloc/post/ProfileBloc.dart';
import 'package:flutterMobileWeb/bloc/post/ProfileEvent.dart';
import 'package:flutterMobileWeb/bloc/post/ProfileState.dart';
import 'package:flutterMobileWeb/repository/AuthRepository.dart';
import 'package:flutterMobileWeb/repository/ProfileRepository.dart';
import 'package:flutterMobileWeb/widgets/AppDrawer.dart';
import 'package:flutterMobileWeb/widgets/Footer.dart';
import 'package:flutterMobileWeb/widgets/Header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/HomeBody.dart';

class Home extends StatefulWidget {
  Home();

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {

  final ProfileRepository _profileRepository = ProfileRepository();
  final AuthRepository _authRepository = AuthRepository();

  ProfileBloc _profileBloc;
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _profileBloc = ProfileBloc(profileRepository: _profileRepository);
    _profileBloc.add(LoadingPostEvent());

    _authenticationBloc = AuthenticationBloc(authRepository: _authRepository);
    _authenticationBloc.add(LoggedIn("moisesvs@gmail.com", "mosava88"));
  }

  @override
  Widget build(BuildContext context) {
    return    
          MultiBlocProvider(
                providers: [
                  BlocProvider<ProfileBloc>(
                    create: (BuildContext context) => _profileBloc
                  ),
                  BlocProvider<AuthenticationBloc>(
                    create: (BuildContext context) => _authenticationBloc,
                  )
                ],
                child:  BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (_, stateProfile) {
                          return BlocBuilder<AuthenticationBloc, AuthenticationState>(
                            builder: (_, authenticationState) {
                              return  createStructurePage(stateProfile, authenticationState);
                          });
                      })
          );
  }

  @override
  void dispose() {
    _profileBloc.close();
    _authenticationBloc.close();
    
    super.dispose();
  }
}

Scaffold createStructurePage (ProfileState stateProfile, AuthenticationState authState) {
  return Scaffold (
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
                    Text(
                    authState.toString(),
                    style: TextStyle( fontWeight: FontWeight.bold, 
                                      color: Colors.black, 
                                      fontSize: 25),
                    ),
                    new Header(),
                    createBody(stateProfile)
                ]
              )
            )
          ),

        bottomNavigationBar: new Footer()
  );
}

Widget createBody (ProfileState stateProfile) {
    if (stateProfile is ProfileLoaded) {
      return new BodyHome(profile: stateProfile.profile);
    } else if (stateProfile is ProfileError)  {
      return new BodyError();
    } else {
      return new BodyLoading();
    }
}
