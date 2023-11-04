import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:tailor_size/statics/assets.dart';
import 'package:tailor_size/statics/constants.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/RegisterScreen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            children: [
              Image.asset(Assets.appLogo),
              Padding(padding: EdgeInsets.only(top: 40)),
              CustomGoogleSigninButton(onPressed: () {}),
              const SizedBox(
                height: 13,
              ),
              const Row(
                children: [
                  Expanded(child: Divider(color: AppThemeData.backgroundBlack)),
                  SizedBox(width: 5,),
                  Text('ou mieux'),
                  SizedBox(width: 5,),
                  Expanded(child: Divider(color: AppThemeData.backgroundBlack,)),
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email *',
                  labelText: 'Email *',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Mot de passe *',
                  labelText: 'Mot de passe *',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Confirmer le mot de passe *',
                  labelText: 'Confirmer le mot de passe *',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomButton(
                    onPressed: (){}, text: "S'inscrire"),
              ),
              const SizedBox(height: 15,),
              const Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Vous avez déjà un compte?', style: TextStyle(fontSize: 12, fontWeight: bold),),
                    SizedBox(width: 5,),
                    Text('Se connecter', style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: bold),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
