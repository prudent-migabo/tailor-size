import 'package:flutter/material.dart';
import 'package:tailor_size/statics/constants.dart';

class CustomRowUserDetailsText extends StatelessWidget {
  const CustomRowUserDetailsText({Key? key, required this.title, required this.description, this.fontSize}) : super(key: key);

  final String title;
  final String description;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Text(title, style: TextStyle(fontSize: fontSize ?? 13),)),
        Expanded(flex: 3, child: Text(description, style: TextStyle(fontWeight: bold, fontSize: fontSize ?? 13),),),
      ],
    );
  }
}
