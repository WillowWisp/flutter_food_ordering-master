import 'package:food_app_concept/core/database/moor_database.dart';
import 'package:food_app_concept/core/interfaces/ifood_repository.dart';
import 'package:food_app_concept/core/repositories/cart_entry_repository.dart';
import 'package:food_app_concept/core/repositories/food_repository.dart';
import 'package:get_it/get_it.dart';

import 'core/interfaces/icart_entry_repository.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => MyDatabase());

  locator.registerLazySingleton<IFoodRepository>(() => FoodRepository());
  locator.registerLazySingleton<ICartEntryRepository>(() => CartEntryRepository());
}