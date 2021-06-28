import 'dart:async';
import 'package:flutter/material.dart';
import '../../modules/home_cubit/home_layout.dart';
import '../../modules/login/login_screen.dart';
import '../../network/local/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    String isLogin = CacheHelper.getDate(key: 'uid');
    Widget mainWidget;
    (isLogin == null || isLogin.isEmpty)
        ? mainWidget = LoginScreen()
        : mainWidget = HomeLayout();

    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => mainWidget),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/icons/splashscreen_bg.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/logo.png'),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Smart Eye',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  ' Best way to help blind people and follow them',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
