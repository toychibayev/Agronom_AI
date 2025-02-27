import 'package:flutter/material.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 155,
      decoration: BoxDecoration(
        color: const Color(0xff81c784),
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "0",
            style: TextStyle(fontSize: 45, color: Color(0xFFFFFFFF)),
          ),
          Text(
            "Rasm izlangan",
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
        ],
      ),
    );
  }
}