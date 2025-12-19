import 'package:flutter/material.dart';
import 'package:workshop_4sim2_2526/pages/auth/reset_password.dart';
import 'package:workshop_4sim2_2526/pages/navigations/nav_bottom.dart';
import 'package:workshop_4sim2_2526/pages/navigations/nav_tab.dart';
import 'package:workshop_4sim2_2526/pages/splash_screen.dart';

import 'pages/auth/update_user.dart';
import 'pages/product_details.dart';
import 'pages/auth/signin.dart';
import 'pages/home/home.dart';
import 'pages/auth/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "G-STORE ESPRIT",
      routes: {
        "/": (context) => SplashScreen(),
        "/signin": (context) => Signin(),
        "/signup": (context) => Signup(),
        "/resetPwd": (context) => ResetPassword(),
        "/navTab": (context) => NavTab(),
        "/navBottom": (context) => NavBottom(),
        "/home/updateUser": (context) => UpdateUser(),
      },
    );
  }
}
