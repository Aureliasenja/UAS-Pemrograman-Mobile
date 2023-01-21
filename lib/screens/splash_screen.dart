import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uas_43a87006190306/main.dart';
import 'package:uas_43a87006190306/screens/home_screen.dart';
import 'package:uas_43a87006190306/theme.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openSplashScreen();
  }

  openSplashScreen() async {
    //bisa diganti beberapa detik sesuai keinginan
    var durasiSplash = const Duration(seconds: 3);
    return Timer(durasiSplash, () {
      //pindah ke halaman home
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return HomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 421,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash.png'),
                ),
              ),
            ),
            Container(
              height: 45,
              child: Text(
                'Cinema-Tix',
                style: whiteTextStyle.copyWith(fontWeight: bold, fontSize: 36),
              ),
            ),
            Container(
              height: 20,
              child: Text(
                'v.1.0',
                style:
                    whiteTextStyle.copyWith(fontWeight: regular, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
