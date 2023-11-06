import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tailor_size/presentation/presentation.dart';

class RouteGenerator {

  static Route<dynamic> onGeneratedRoutes(RouteSettings settings){
    print(settings.name);
    switch (settings.name){
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case WelcomeScreen.routeName:
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case DashboardScreen.routeName:
        return MaterialPageRoute(builder: (context) => const DashboardScreen());
      case ClientDetailsScreen.routeName:
      return MaterialPageRoute(builder: (context) => const ClientDetailsScreen());
      case ClientPersonalDetails.routeName:
        return MaterialPageRoute(builder: (context) => const ClientPersonalDetails());
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text('Page non trouvée'),
        ),
      );
    }
    );
  }

}