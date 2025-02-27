import 'package:flutter/material.dart';

class ImageListWidget extends StatelessWidget {
  const ImageListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/imgs/rasm_1.png",
      "assets/imgs/rasm_2.png",
      "assets/imgs/rasm_1.png",
      "assets/imgs/rasm_2.png"
    ];

    return SizedBox(
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
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
    );
  }
}