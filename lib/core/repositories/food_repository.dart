import 'package:food_app_concept/core/database/moor_database.dart';
import 'package:food_app_concept/core/dtos/food/food_dto.dart';
import 'package:food_app_concept/core/dtos/food/food_input_dto.dart';
import 'package:food_app_concept/core/interfaces/ifood_repository.dart';
import 'package:food_app_concept/locator.dart';

class FoodRepository implements IFoodRepository {
  final database = locator<MyDatabase>();

  @override
  Future<List<FoodDto>> getAllFoods() async {
    // final database = locator<MyDatabase>();
    List<FoodEntity> foodEntityList = await database.getAllFoods();
    List<FoodDto> foodList = foodEntityList.map((foodEntity) => FoodDto.fromEntity(foodEntity)).toList();
    return foodList;
  }

  @override
  Future<void> insertFood(FoodInputDto food) async {
    // final database = locator<MyDatabase>();
    await database.insertFood(food.toEntity());
  }

  @override
  Future<void> deleteFood(int id) async {
    // final database = locator<MyDatabase>();
    await database.deleteFood(id);
  }
}