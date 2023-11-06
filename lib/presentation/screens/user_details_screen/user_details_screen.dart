import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  static const String routeName = '/UserDetailsScreen';
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){},
            child: const Icon(Icons.arrow_back),),
      ),
    );
  }
}
