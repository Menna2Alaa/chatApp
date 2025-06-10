import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomeButton extends StatelessWidget {
  CustomeButton({super.key, required this.buttonText, this.onTap});
  final String buttonText;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(child: Text(buttonText)),
      ),
    );
  }
}
