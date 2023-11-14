import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tailor_size/business_logic/business_logic.dart';
import 'package:tailor_size/config/routes.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = Settings(
    persistenceEnabled: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthStreamCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => SelectShoulderCubit(),
        ),
        BlocProvider(
          create: (context) => SelectBellyCubit(),
        ),
        BlocProvider(
          create: (context) => SelectBustCubit(),
        ),
        BlocProvider(
          create: (context) => ClientCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tailor size',
        theme: AppThemeData.lightTheme,
        onGenerateRoute: RouteGenerator.onGeneratedRoutes,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}

