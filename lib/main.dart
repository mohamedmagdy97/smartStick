import 'package:firebase_core/firebase_core.dart';
import '../../components/colors.dart';
import '../../components/constants.dart';
import '../../shared/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/splashscreen/splashscreen.dart';
import 'network/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  uid = CacheHelper.getDate(key: 'uid');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Stick',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Color(0xFF8159DB),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          titleSpacing: 20,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black26,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: secondColor,
            fontSize: 24,
          ),
          iconTheme: IconThemeData(
            color: secondColor,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: defaultColor,
          unselectedItemColor: Colors.black,
          elevation: 10,
          backgroundColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontFamily: 'Janna',
          ),
        ),
        fontFamily: 'Janna',
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
