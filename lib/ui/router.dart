import 'package:flutter/material.dart';
import 'package:food_app_concept/ui/screens/cart_screen.dart';
import 'package:food_app_concept/ui/screens/food_manage_screen.dart';
import 'package:food_app_concept/ui/screens/home_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/food-manage':
        return MaterialPageRoute(builder: (_) => FoodManageScreen());
      case '/my-cart':
        return MaterialPageRoute(builder: (_) => CartScreen());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: Text('No route found: ${settings.name}.'),
          ),
        ));
    }
  }
}