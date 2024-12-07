import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final Color color;
  final TextStyle textStyle;
  final BorderRadiusGeometry borderRadius;

  const CommonButton({
    required this.text,
    required this.onPressed,
    this.height = 50, // Default height
    this.width = double.infinity, // Default width to take full available width
    this.color = Colors.blue, // Default color
    this.textStyle = const TextStyle(color: Colors.white),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)), // Default border radius
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
