import 'package:flutter/material.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:tailor_size/presentation/widgets/custom_button.dart';
import 'package:tailor_size/statics/statics.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/WelcomeScreen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Image.asset(Assets.appLogo)),
              const SizedBox(height: 30,),
              const Expanded(child: Text('Welcome to your\n     Taillor size', style: TextStyle(fontWeight: bold, fontSize: 18),),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomButton(onPressed: (){
                    Navigator.pushNamed(context, RegisterScreen.routeName);
                  }, text: 'Créer un compte'),
                  const SizedBox(height: 20,),
                  CustomButton(
                    elevation: 0,
                    backgroundColor: Colors.grey.withOpacity(.4),
                      onPressed: (){
                      Navigator.pushNamed(context, LoginScreen.routeName);
                      }, text: 'Se connecter', textColor: AppThemeData.textGrey.withOpacity(.5),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
