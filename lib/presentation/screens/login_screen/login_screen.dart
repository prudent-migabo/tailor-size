import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tailor_size/business_logic/business_logic.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:tailor_size/statics/statics.dart';
import 'package:tailor_size/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  loginWithEmailAndPassword() {
    if (!_formKey.currentState!.validate()) return;
    context
        .read<AuthCubit>()
        .loginUser(email: _email.text.trim(), password: _password.text.trim());
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
            child: Column(
              children: [
                Image.asset(Assets.appLogo),
                const Padding(padding: EdgeInsets.only(top: 40)),
                CustomGoogleSigninButton(
                  onPressed: signInWithGoogle,
                ),
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
                      ? 'Ce champ ne peut pas être vide'
                      : !value.contains('@')
                          ? 'Email incorrect'
                          : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _password,
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
                  height: 25,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return CustomButton(
                          onPressed: state.authStatus == AuthStatus.submitting
                              ? () {}
                              : loginWithEmailAndPassword,
                          text: state.authStatus == AuthStatus.submitting
                              ? "Patientez..."
                              : "Connexion");
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Mot de passe oublié?',
                    style: TextStyle(
                        color: Colors.blue, fontSize: 12, fontWeight: bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
