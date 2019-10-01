import 'package:flutter/material.dart';

class PageTitles {
  static const String home = 'Home';
  static const String details = 'Details';
}

class RouteNames {
  static const String home = '/';
  static const String details = 'details';
}

class AppRouteObserver extends RouteObserver<PageRoute> {
  factory AppRouteObserver() => _instance;

  AppRouteObserver._private();

  static final AppRouteObserver _instance = AppRouteObserver._private();
}