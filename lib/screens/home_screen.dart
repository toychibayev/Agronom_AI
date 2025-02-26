// ignore_for_file: library_private_types_in_public_api

import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPos = 0;
  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  void dispose() {
    _navigationController.dispose();
    super.dispose();
  }

  List<TabItem> tabItems = [
    TabItem(
      Icons.home,
      "Home",
      Colors.blue,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.camera_alt_outlined,
      "Camera",
      Colors.blue,
    ),
    TabItem(
      Icons.history,
      "Historiya",
      Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/imgs/user.png",
                        fit: BoxFit.contain,
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Samuel Joe",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    "assets/svgs/setting.svg",
                    height: 30,
                    width: 30,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 30,
            right: 30,
            child: Container(
              width: 350,
              height: 155,
              decoration: BoxDecoration(
                color: Color(0xff81c784),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "0",
                    style: TextStyle(fontSize: 45, color: Color(0xFFFFFFFF)),
                  ),
                  Text(
                    "Rasm izlangan",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 260,
            left: 14,
            child: Text(
              "Ohirgi qidiruvlar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 400, // Rasmlarning balandligini moslashtiring
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  List<String> images = [
                    "assets/imgs/rasm_1.png",
                    "assets/imgs/rasm_2.png",
                    "assets/imgs/rasm_1.png",
                    "assets/imgs/rasm_2.png"
                  ];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      images[index],
                      width: 180,
                      height: 400,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CircularBottomNavigation(
              tabItems,
              controller: _navigationController,
              barHeight: 70,
              circleSize: 60,
              iconsSize: 35,
              barBackgroundColor: Color(0xFF81C784),
              normalIconColor: Color(0xFFFFFFFF),
              backgroundBoxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 10.0),
              ],
              selectedCallback: (int? selectedPos) {
                setState(
                  () {
                    this.selectedPos = selectedPos ?? 0;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
