// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final Color color;

  const OrangeButton({
    Key? key,
    required this.text,
    this.height = 50,
    this.width = 150,
    this.color = Colors.orange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: this.width,
      height: this.height,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
