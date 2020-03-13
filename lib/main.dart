import 'package:flutter/material.dart';
import 'package:food_app_concept/core/database/moor_database.dart';
import 'package:food_app_concept/core/repositories/food_repository.dart';
import 'package:food_app_concept/core/viewmodels/cart_entry_viewmodel.dart';
import 'package:food_app_concept/core/viewmodels/food_viewmodel.dart';
import 'package:food_app_concept/locator.dart';
import 'package:food_app_concept/ui/router.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FoodViewmodel>(create: (_) => FoodViewmodel(),),
        ChangeNotifierProvider<CartEntryViewmodel>(create: (_) => CartEntryViewmodel(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) => Router.generateRoute(settings),
      ),
    );
  }
}
