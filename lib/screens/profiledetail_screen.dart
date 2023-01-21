import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileDetailScreens extends StatelessWidget {
  const ProfileDetailScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Windi'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/backgrounds.jpg'),
                        fit: BoxFit.cover),
                    border: Border.all(color: Colors.black26)),
                child: Center(
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 60,
                      ),
                      CircleAvatar(
                        radius: 48,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Windi',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '43A87006190306',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60, left: 60),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.orangeAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Bekasi')
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Colors.orangeAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('wnd016@gmail.com')
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone_android,
                          color: Colors.orangeAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('+62 895-3761-85501')
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 60, right: 60, top: 50),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orangeAccent, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.logout,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Sign Out')
                      ],
                    )),
              )
            ],
          ),
          Container(
            height: 54,
            margin: EdgeInsets.only(top: 220, left: 60, right: 60),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: Colors.black26)),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Personal Info'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Family'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Vitals'),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
