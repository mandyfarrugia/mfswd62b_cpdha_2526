import 'package:flutter/material.dart';

class AssetCardButton extends StatelessWidget {
  final Color backgroundColour;
  final Color foregroundColour;
  final String buttonText;
  final VoidCallback callback;

  const AssetCardButton({super.key, required this.backgroundColour, required this.foregroundColour, required this.buttonText, required this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColour,
        foregroundColor: foregroundColour
      ),
      onPressed: callback,
      child: Text(buttonText)
    );
  }
}