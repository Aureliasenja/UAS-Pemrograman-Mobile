import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_43a87006190306/screens/favorite_screen.dart';
import 'package:uas_43a87006190306/screens/listmovie_screen.dart';
import 'package:uas_43a87006190306/screens/profile_screen.dart';
import 'package:uas_43a87006190306/screens/bioskop_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> screens = [
    ListMovieScreen(),
    FavoriteScreen(),
    BioskopScreen(),
    ProfileScreen()
  ];

  var selectedIndex = 0.obs;
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'List Movie',
        home: Obx(() => Scaffold(
              body: screens[selectedIndex.value],
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: selectedIndex.value,
                  onTap: (index) {
                    selectedIndex.value = index;
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_filled),
                        label: 'Home',
                        backgroundColor: Colors.lightBlue),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite), label: 'Favorite'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.apartment), label: 'Bioskop'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: 'Profile'),
                  ]),
            )));
  }
}
