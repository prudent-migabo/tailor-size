import 'package:flutter/material.dart';
import 'package:tailor_size/config/theming.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppThemeData.secondaryColor,
        ),
        child: const Icon(Icons.add, color: AppThemeData.primaryColor,),
      ),
    );
  }
}
