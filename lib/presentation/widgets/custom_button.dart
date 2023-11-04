import 'package:flutter/material.dart';
import 'package:tailor_size/statics/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onPressed, required this.text, this.backgroundColor, this.buttonHeight, this.textColor, this.elevation}) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final double? buttonHeight;
  final Color? textColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight ?? 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          elevation: elevation,
        ),
        child: Text(text,
          style:  TextStyle(
            fontWeight: bold,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
