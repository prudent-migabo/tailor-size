import 'package:flutter/material.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/data/data.dart';
import 'package:tailor_size/main.dart';
import 'package:tailor_size/presentation/presentation.dart';

Widget navigationDrawer(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.85,
    height: MediaQuery.of(context).size.height,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
    color: AppThemeData.scaffoldColor,
    child: Column(
      children: [
        GestureDetector(
          onTap: () async {
            await AuthRepository().signOutUser().whenComplete(
                  () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const MyApp()),
                      (route) => false),
                  // Navigator.pushNamedAndRemoveUntil(
                  //  context, WelcomeScreen.routeName, (route) => false),
                );
          },
          child: const ListTile(
            leading: Icon(Icons.logout),
            title: Text('Se deconnecter'),
          ),
        ),
        const Divider(
          color: Colors.grey,
          height: 0.7,
          thickness: 0.4,
        ),
      ],
    ),
  );
}
