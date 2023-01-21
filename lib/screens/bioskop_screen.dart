import 'package:flutter/material.dart';

class BioskopScreen extends StatelessWidget {
  final List bioskop = [
    "BEKASI CYBER PARK CGV",
    "BEKASI TRADE CENTER CGV",
    "BLU PLAZA CINEPOLIS",
    "CIPUTRA CIBUBUR PREMIRE",
    "CIPUTRA CIBUBUR XXI",
    "COURTS KHI XXI",
    "GRAND MALL BEKASI",
    "GRAND METROPOLITAN PREMIRE",
    "GRAND METROPOLITAN XXI",
    "GREEN WALK MALL XIXI",
    "MEGA BEKASI XXI",
    "METROPOLITAN XXI"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bioskop List'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => Container(
            height: 64,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.stars_sharp,
                    color: Colors.amber,
                  ),
                  Text(
                    bioskop[index],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  Icon(Icons.chevron_right)
                ],
              ),
            ),
          ),
          itemCount: bioskop.length,
        ),
      ),
    );
  }
}
