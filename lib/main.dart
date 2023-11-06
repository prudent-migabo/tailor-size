import 'package:flutter/material.dart';
import 'package:tailor_size/config/routes.dart';
import 'package:tailor_size/config/theming.dart';
import 'package:tailor_size/presentation/presentation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Tailor size',
      theme: AppThemeData.lightTheme,
      onGenerateRoute: RouteGenerator.onGeneratedRoutes,
      initialRoute: DashboardScreen.routeName,
    );
  }
}

