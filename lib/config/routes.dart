import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tailor_size/data/models/client_arguments.dart';
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
      return MaterialPageRoute(builder: (context) =>  ClientDetailsScreen(
        clientArguments: settings.arguments as ClientArguments,
      ));
      case ClientPersonalDetails.routeName:
        return MaterialPageRoute(builder: (context) => const ClientPersonalDetails());
      case MeasureScreen.routeName:
        return MaterialPageRoute(builder: (context) =>  MeasureScreen(
          clientArguments: settings.arguments as ClientArguments,
        ),);
      case MeasureProfileScreen.routeName:
        return MaterialPageRoute(builder: (context) =>  MeasureProfileScreen(
          clientArguments: settings.arguments as ClientArguments,
        ));
      case UpdateClientPersonalDetails.routeName:
        return MaterialPageRoute(builder: (context) =>  UpdateClientPersonalDetails(
          clientArguments: settings.arguments as ClientArguments,
        ));
      case UpdateMeasureScreen.routeName:
        return MaterialPageRoute(builder: (context) =>  UpdateMeasureScreen(
          clientArguments: settings.arguments as ClientArguments,
        ));
      case UpdateMeasureProfileScreen.routeName:
        return MaterialPageRoute(builder: (context) =>  UpdateMeasureProfileScreen(
          clientArguments: settings.arguments as ClientArguments,
        ));
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