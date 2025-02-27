// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            const SizedBox(width: 15),
            const Text(
              "Samuel Joe",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SvgPicture.asset(
          "assets/svgs/setting.svg",
          height: 30,
          width: 30,
        ),
      ],
    );
  }
}