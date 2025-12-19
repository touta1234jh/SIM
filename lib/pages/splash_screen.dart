import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workshop_4sim2_2526/pages/auth/signin.dart';
import 'package:workshop_4sim2_2526/pages/navigations/nav_tab.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _toHome = false;
  late Future<bool> _fetchedUserSession;

  Future<bool> _fetchUserSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("userId")) {
      _toHome = true;
    }

    return true;
  }

  @override
  void initState() {
    _fetchedUserSession = _fetchUserSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchedUserSession,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            if(_toHome) {
              return NavTab();
            } else {
              return Signin();
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }
}
