
import 'package:flutter/material.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/statics/statics.dart';

class CustomCardListTile extends StatelessWidget {
  const CustomCardListTile({Key? key, required this.textInLeading, required this.title, required this.subtitle, this.onPressed}) : super(key: key);

  final String textInLeading;
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 0,
        color: AppThemeData.listTileBackgroundColor.withOpacity(.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side:  const BorderSide(color: AppThemeData.backgroundGrey, width: 0.5),
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: AppThemeData.primaryColor,
            child: Text(textInLeading, style: const TextStyle(color: Colors.white),),
          ),
          title: Text(title, style: const TextStyle(fontWeight: bold),),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
