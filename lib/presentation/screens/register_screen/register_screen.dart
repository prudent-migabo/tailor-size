import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tailor_size/business_logic/business_logic.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/data/data.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:tailor_size/statics/assets.dart';
import 'package:tailor_size/statics/constants.dart';
import 'package:tailor_size/utils/utils.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/RegisterScreen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  registerWithEmailAndPassword(){
    if(!_formKey.currentState!.validate()) return;
    context.read<AuthCubit>().createUser(email: _email.text.trim(), password: _password.text.trim());
  }

  signInWithGoogle() {
    context.read<AuthCubit>().signInUserWithWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.authStatus == AuthStatus.submitted) {
          Navigator.pushNamedAndRemoveUntil(
              context, DashboardScreen.routeName, (route) => false);
        } else if (state.authStatus == AuthStatus.error) {
          errorDialog(context, content: state.error);
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(Assets.appLogo),
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  CustomGoogleSigninButton(onPressed: signInWithGoogle),
                  const SizedBox(
                    height: 13,
                  ),
                  const Row(
                    children: [
                      Expanded(
                          child: Divider(color: AppThemeData.backgroundBlack)),
                      SizedBox(
                        width: 5,
                      ),
                      Text('ou mieux'),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Divider(
                        color: AppThemeData.backgroundBlack,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      hintText: 'Email *',
                      labelText: 'Email *',
                    ),
                    validator: (value) => value!.isEmpty
                        ? 'Ce champ ne peut pas etre vide'
                        : !value.contains('@')
                            ? 'Email incorrect'
                            : null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Mot de passe *',
                      labelText: 'Mot de passe *',
                    ),
                    validator: (value) => value!.isEmpty
                        ? 'Ce champ ne peut pas etre vide'
                        : value.length < 6
                            ? 'Mot de passe trop court'
                            : null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _confirmPassword,
                    decoration: const InputDecoration(
                      hintText: 'Confirmer le mot de passe *',
                      labelText: 'Confirmer le mot de passe *',
                    ),
                    validator: (value) {
                      if (value != _password.text) {
                        return 'Les 2 mots de passe doivent être les même';
                      } else if (value!.isEmpty){
                        return 'Ce champ ne peut pas etre vide';
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return CustomButton(
                            onPressed: state.authStatus == AuthStatus.submitting
                                ? () {}
                                : registerWithEmailAndPassword,
                            text: state.authStatus == AuthStatus.submitting
                                ? "Patientez..."
                                : "S'inscrire");
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Vous avez déjà un compte?',
                          style: TextStyle(fontSize: 12, fontWeight: bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: (){
                            final res = Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                          child: const Text(
                            'Se connecter',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
