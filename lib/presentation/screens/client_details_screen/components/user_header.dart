import 'package:flutter/material.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/statics/constants.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({Key? key, required this.textInLeading, required this.name, required this.profession, required this.phone, required this.email}) : super(key: key);
  
  final String textInLeading;
  final String name;
  final String profession;
  final String phone;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: AppThemeData.primaryColor,
          radius: 20,
          child: Text(textInLeading, style: TextStyle(color: Colors.white),),
        ),
        const SizedBox(width: 20,),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(fontWeight: bold),),
             const Separator(),
            Text(profession),
            const Separator(),
            Text(phone),
            const Separator(),
            Text(email, style:  TextStyle(color: Colors.grey.shade700),),
          ],
        ))
      ],
    );
  }
}

class Separator extends StatelessWidget {
  const Separator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 6,);
  }
}
