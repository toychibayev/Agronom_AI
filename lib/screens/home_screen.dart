// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:image/image.dart' as img;
import 'package:agronom_ai/widgets/imageList_widget.dart';
import 'package:agronom_ai/widgets/infoCard_widget.dart';
import 'package:agronom_ai/widgets/userProfile_widget.dart';
import 'package:agronom_ai/screens/history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPos = 0;
  late CircularBottomNavigationController _navigationController;
  final ImagePicker _picker = ImagePicker();
  List<String> images = [
    "assets/imgs/rasm_1.png",
    "assets/imgs/rasm_2.png",
    "assets/imgs/rasm_1.png",
    "assets/imgs/rasm_2.png"
  ];

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

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image == null) return;

    File file = File(image.path);
    List<int> imageBytes = await file.readAsBytes();
    img.Image? decodedImage = img.decodeImage(
      Uint8List.fromList(imageBytes),
    );

    if (decodedImage != null) {
      img.Image resizedImage =
          img.copyResize(decodedImage, width: 600, height: 600);
      File resizedFile = File(image.path)
        ..writeAsBytesSync(
          img.encodeJpg(
            resizedImage,
            quality: 85,
          ),
        );
      setState(() {
        images.insert(0, resizedFile.path);
        _navigationController.value = 0;
      });
    }
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Kamera orqali olish"),
              onTap: () => _selectImage(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Galereyadan tanlash"),
              onTap: () => _selectImage(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }

  void _selectImage(ImageSource source) {
    Navigator.pop(context);
    _pickImage(source);
  }

  void _onTabSelected(int? pos) {
    if (pos == null) return;
    if (pos == 1) {
      _showImagePickerOptions();
    } else if (pos == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HistoryScreen()),
      ).then((_) => setState(() => _navigationController.value = 0));
    } else {
      setState(() => selectedPos = pos);
    }
  }

  List<TabItem> get tabItems => [
        TabItem(Icons.home, "Home", Colors.blue,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold)),
        TabItem(Icons.camera_alt_outlined, "Camera", Colors.blue),
        TabItem(Icons.history, "Historiya", Colors.blue),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
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
            child: ImageListWidget(images: images),
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
              normalIconColor: Colors.white,
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
