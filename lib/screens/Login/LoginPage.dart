import 'package:flutter/material.dart';
import 'package:flutterMobileWeb/bloc/authentication/AuthenticationBloc.dart';
import 'package:flutterMobileWeb/bloc/authentication/AuthenticationEvent.dart';
import 'package:flutterMobileWeb/bloc/authentication/AuthenticationState.dart';
import 'package:flutterMobileWeb/data/PostFeed.dart';
import 'package:flutterMobileWeb/repository/AuthRepository.dart';
import 'package:flutterMobileWeb/screens/DetailPost/DetailPostsView.dart';
import 'package:flutterMobileWeb/widgets/AppDrawer.dart';
import 'package:flutterMobileWeb/widgets/Footer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  
  static const routeName = '/login';

  LoginPage();

  @override
  State<LoginPage> createState() => LoginState();
}

class LoginState extends State<LoginPage> {

  final AuthRepository _authRepository = AuthRepository();
  AuthenticationBloc _authenticationBloc;

  String email;
  TextEditingController emailController = new TextEditingController();

  String password;
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    _authenticationBloc = AuthenticationBloc(authRepository: _authRepository);
  }

  @override
  Widget build(BuildContext context) {
    return    
          MultiBlocProvider(
                providers: [
                  BlocProvider<AuthenticationBloc>(
                    create: (BuildContext context) => _authenticationBloc,
                  )
                ],
                child:  BlocListener<AuthenticationBloc, AuthenticationState>(
                          listener: (context, state) {
                            if (state is Authenticated) {
                              Navigator.of(context).pushNamed(DetailsPostsView.routeName, arguments: DetailsPostsArguments(PostFeed(id: 1, 
                                                                                                                                    title: "Test", 
                                                                                                                                    shortDescription: "Mi descripcion", 
                                                                                                                                    description: "Mi descripcion")));
                            }
                          },
                          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                            builder: (_, authenticationState) {
                              return  createStructurePage(authenticationState);
                          })
                )
          );
  }


  Scaffold createStructurePage (AuthenticationState authState) {
    return Scaffold (
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.grey,
          drawer: const AppDrawer(
                  permanentlyDisplay: true,
                ),
          body:
            Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: emailController,
                      style: TextStyle(color: Colors.black87),
                      decoration: const InputDecoration(labelText: 'Email', 
                                                        hintText: 'Email', 
                                                        hintStyle: TextStyle(color: Colors.black87)),
                      keyboardType: TextInputType.emailAddress
                    ),
                    TextFormField(
                      controller: passwordController,
                      style: TextStyle(color: Colors.black87),
                      decoration: const InputDecoration(labelText: 'Password', 
                                                        hintText: 'Password', 
                                                        hintStyle: TextStyle(color: Colors.black87)),
                      keyboardType: TextInputType.visiblePassword,
                      ),
                      RaisedButton(
                        onPressed: () => validateInput(emailController.text, passwordController.text),
                        child: new Text('Login'),
                      )
                  ]
                )
            ),

          bottomNavigationBar: new Footer()
    );
  }

  void validateInput (String email, String password) {
      _authenticationBloc.add(LoggedIn(email, password));
  }

  @override
  void dispose() {
    _authenticationBloc.close();
    
    super.dispose();
  }
}

