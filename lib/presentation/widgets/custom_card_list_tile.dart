
import 'package:flutter/material.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/statics/statics.dart';

class CustomCardListTile extends StatelessWidget {
  const CustomCardListTile({Key? key, required this.textInLeading, required this.title, required this.subtitle}) : super(key: key);

  final String textInLeading;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppThemeData.secondaryColor.withOpacity(.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppThemeData.backgroundBlack),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 40,
          backgroundColor: AppThemeData.primaryColor,
          child: Text(textInLeading),
        ),
        title: Text(title, style: const TextStyle(fontWeight: bold),),
        subtitle: Text(subtitle),
      ),
    );
  }
}
