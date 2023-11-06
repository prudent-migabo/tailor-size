import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/statics/assets.dart';

class UserFooter extends StatelessWidget {
  const UserFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.shoulder1),
        const SizedBox(width: 20),
        Image.asset(Assets.belly1),
        const SizedBox(width: 20),
        Image.asset(Assets.bust1),
      ],
    );
  }
}
