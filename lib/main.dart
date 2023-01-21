import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_43a87006190306/screens/home_screen.dart';
import 'package:uas_43a87006190306/screens/profile_screen.dart';
import 'package:uas_43a87006190306/screens/bioskop_screen.dart';
import 'package:uas_43a87006190306/screens/splash_screen.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Fluterku',
      home: SplashScreenPage(),
    );
  }
}
