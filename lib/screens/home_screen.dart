// ignore_for_file: library_private_types_in_public_api, no_leading_underscores_for_local_identifiers, unused_field

import 'dart:developer';

import 'package:agronom_ai/screens/history_screen.dart';
import 'package:agronom_ai/widgets/imageList_widget.dart';
import 'package:agronom_ai/widgets/infoCard_widget.dart';
import 'package:agronom_ai/widgets/userProfile_widget.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPos = 0;
  late CircularBottomNavigationController _navigationController;
  final ImagePicker _picker = ImagePicker();

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
      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
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

  /// Kamerani ochish va rasm olish funksiyasi
  Future<void> pickImageFromCamera() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.camera);

  if (image != null) {
    setState(() {
      log("Rasm olindi: ${image.path}");
    });
  } else {
    log("Rasm olinmadi");
  }
}


  void _onTabSelected(int? selectedPos) {
    setState(() {
      this.selectedPos = selectedPos ?? 0;
    });

    if (selectedPos == 1) {
      pickImageFromCamera(); // Kamera ochish
    } else if (selectedPos == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HistoryScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: UserProfileWidget(),
          ),
          Positioned(
            top: 70,
            left: 30,
            right: 30,
            child: const InfoCardWidget(),
          ),
          Positioned(
            top: 260,
            left: 14,
            child: const Text(
              "Ohirgi qidiruvlar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: const ImageListWidget(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CircularBottomNavigation(
              tabItems,
              controller: _navigationController,
              barHeight: 70,
              circleSize: 60,
              iconsSize: 35,
              barBackgroundColor: const Color(0xFF81C784),
              normalIconColor: const Color(0xFFFFFFFF),
              backgroundBoxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 10.0),
              ],
              selectedCallback: _onTabSelected,
            ),
          ),
        ],
      ),
    );
  }
}
