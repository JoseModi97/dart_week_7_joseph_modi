// lib/custom_button.dart

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label; // Button label
  final VoidCallback onPressed; // Callback function for button press

  const CustomButton({required this.label, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.0), // Vertical padding
        textStyle: TextStyle(fontSize: 16), // Button text size
      ),
      child: Text(label), // Button label text
    );
  }
}
