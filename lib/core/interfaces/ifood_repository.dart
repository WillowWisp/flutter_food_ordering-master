
import 'package:food_app_concept/core/dtos/food/food_dto.dart';
import 'package:food_app_concept/core/dtos/food/food_input_dto.dart';

abstract class IFoodRepository {
  Future<List<FoodDto>> getAllFoods();
  Future<void> insertFood(FoodInputDto food);
  Future<void> deleteFood(int id);
}