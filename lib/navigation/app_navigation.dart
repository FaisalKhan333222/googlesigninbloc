import 'package:faisalbloc/screens/homescreen.dart';
import 'package:faisalbloc/screens/signinscreen.dart';
import 'package:faisalbloc/screens/signupscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationPage {
  static Route<dynamic>? getPage(RouteSettings settings) {
    switch (settings.name) {
      case SignInScreen.PAGE_NAME:
        {
          return MaterialPageRoute(
              builder: (context) => SignInScreen(), settings: settings);
        }
      case SignUpScreen.PAGE_NAME:
        {
          return MaterialPageRoute(
              builder: (context) => SignUpScreen(), settings: settings);
        }
      case HomeScreen.PAGE_NAME:
        {
          return MaterialPageRoute(
              builder: (context) => HomeScreen(), settings: settings);
        }
      default:
        {
          return MaterialPageRoute(
              builder: (context) => HomeScreen(), settings: settings);
        }
    }
  }
}
