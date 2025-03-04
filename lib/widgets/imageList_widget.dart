// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/material.dart';

class ImageListWidget extends StatelessWidget {
  final List<String> images;

  const ImageListWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: images[index].startsWith("assets")
                ? Image.asset(
                    images[index],
                    width: 180,
                    height: 400,
                    fit: BoxFit.contain,
                  )
                : Image.file(
                    File(
                      images[index],
                    ),
                    width: 180,
                    height: 380,
                    fit: BoxFit.cover,
                  ),
          );
        },
      ),
    );
  }
}
