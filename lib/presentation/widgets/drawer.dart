import 'package:flutter/material.dart';
import 'package:tailor_size/data/data.dart';
import 'package:tailor_size/presentation/presentation.dart';

Widget navigationDrawer (BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.85,
    height: MediaQuery.of(context).size.height,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
    color: Colors.white,
    child: Column(
      children: [
        GestureDetector(
          onTap: (){
            AuthRepository().signOutUser();
            Navigator.pushNamedAndRemoveUntil(
                context, WelcomeScreen.routeName, (route) => false);
          },
          child: const ListTile(
            leading: Icon(Icons.logout),
            title: Text('Se deconnecter'),
          ),
        ),
        Divider(),
      ],
    ),
  );
}
