import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/statics/statics.dart';

class CustomGoogleSigninButton extends StatelessWidget {
  const CustomGoogleSigninButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppThemeData.scaffoldColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppThemeData.buttonPrimary)
        ),
      ),
        onPressed: onPressed, child: Row(
      children: [
        SvgPicture.asset(Assets.googleLogo, height: 20, width: 20,),
        const Text('Continuer avec google', style: TextStyle(fontWeight: bold),),
      ],
    ));
  }
}
