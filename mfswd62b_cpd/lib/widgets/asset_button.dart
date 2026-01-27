import 'package:flutter/material.dart';

class AssetButton extends StatelessWidget {
  final Color backgroundColour;
  final Color foregroundColour;
  final IconData iconData;
  final String buttonText;
  final VoidCallback callback;

  const AssetButton({super.key, required this.backgroundColour, required this.iconData, required this.foregroundColour, required this.buttonText, required this.callback});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColour,
          foregroundColor: foregroundColour,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          minimumSize: Size.zero
        ),
      onPressed: callback,
      child: Row(children: [
        Icon(iconData),
          const SizedBox(width: 6),
          Text(buttonText)
      ],)
    ));
  }
}