import 'package:flutter/material.dart';
import 'package:flutterMobileWeb/screens/DetailPost/DetailPostsView.dart';
import 'package:flutterMobileWeb/screens/Home/HomePage.dart';
import 'package:flutterMobileWeb/screens/Login/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp();

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
                  theme: createThemeData(),
                  routes: <String, WidgetBuilder> {
                    HomePage.routeName : (BuildContext context) => HomePage(),
                    DetailsPostsView.routeName : (BuildContext context) => DetailsPostsView(),
                    LoginPage.routeName : (BuildContext context) => LoginPage(),
                  },
                  initialRoute: '/home',
    );
  }

  ThemeData createThemeData(){
    return ThemeData (
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
      );
  }

  @override
  void dispose() {    
    super.dispose();
  }
}