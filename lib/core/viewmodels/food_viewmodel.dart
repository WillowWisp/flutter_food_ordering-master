import 'package:flutter/foundation.dart';
import 'package:food_app_concept/core/dtos/food/food_dto.dart';
import 'package:food_app_concept/core/dtos/food/food_input_dto.dart';
import 'package:food_app_concept/core/interfaces/ifood_repository.dart';
import 'package:food_app_concept/locator.dart';

class FoodViewmodel extends ChangeNotifier {
  FoodViewmodel() {
    fetchAllFoods();
  }

  List<FoodDto> _foodList = [];

  List<FoodDto> get foodList => _foodList;

  Future fetchAllFoods() async {
    final foodRepository = locator<IFoodRepository>();
    _foodList = await foodRepository.getAllFoods();
    notifyListeners();
  }

  Future insertFood(FoodInputDto food) async {
    final foodRepository = locator<IFoodRepository>();
    await foodRepository.insertFood(food);
    fetchAllFoods(); // TODO: temp

    // _foodList.add(food);
    // notifyListeners();
  }
}
