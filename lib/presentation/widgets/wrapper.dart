import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tailor_size/business_logic/business_logic.dart';
import 'package:tailor_size/business_logic/cubits/auth_stream_cubit/auth_stream_state.dart';
import 'package:tailor_size/presentation/presentation.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthStreamCubit, AuthStreamState>(
        builder: (context, state) {
          if (state.userAuthStatus == UserAuthStatus.unauthenticated){
            print('##############');
            return const WelcomeScreen();
          }
          else {
            print('@@@@@@@@@@@@@@');
            return const DashboardScreen();
          }
        });
  }
}