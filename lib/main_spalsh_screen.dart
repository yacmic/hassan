import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class MainSplashSceen extends StatefulWidget {
  const MainSplashSceen({Key? key}) : super(key: key);

  @override
  _MainSplashSceen createState() => _MainSplashSceen();
}

class _MainSplashSceen extends State<MainSplashSceen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreenView(
          navigateRoute: null,
          duration: 500,
          text: 'data',
        ),
      ),
    );
  }
}
