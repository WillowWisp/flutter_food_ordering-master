import 'package:food_app_concept/core/database/moor_database.dart';
import 'package:food_app_concept/core/dtos/cart_entry/cart_entry_input_dto.dart';
import 'package:food_app_concept/core/dtos/cart_entry/cart_entry_output_dto.dart';
import 'package:food_app_concept/core/interfaces/icart_entry_repository.dart';
import 'package:food_app_concept/locator.dart';
import 'package:moor_flutter/moor_flutter.dart';

class CartEntryRepository implements ICartEntryRepository {
  final database = locator<MyDatabase>();
  
  // @override
  // Future<List<CartEntryOutputDto>> getAllCartEntriesByUserId(int userId) async {
  //   List<CartEntryEntity> entityList = await database.getAllCartEntriesByUser(userId);
  //   List<CartEntryOutputDto> result = [];
  //   for (var i = 0; i < entityList.length; i++) {
  //     FoodEntity foodEntity = await database.getFoodById(entityList[i].foodId);
  //     result.add(CartEntryOutputDto.fromEntities(entityList[i], foodEntity));
  //   }

  //   // print(result[0].discountCode);
  //   return result;
  // }

  @override
  Future<List<CartEntryOutputDto>> getAllCartEntriesByUserId(int userId) async {
    var query = database.select(database.cartEntries).join([
      leftOuterJoin(database.foods, database.foods.id.equalsExp(database.cartEntries.foodId))
    ]);

    List<TypedResult> rows = await query.get();

    List<CartEntryOutputDto> outputList = rows
      .map((row) {
        var cartEntryEntity = row.readTable(database.cartEntries);
        var foodEntity = row.readTable(database.foods);
        return CartEntryOutputDto.fromEntities(cartEntryEntity, foodEntity);
      }).toList();

    return outputList;
  }

  @override
  Future<void> insertCartEntry(CartEntryInputDto cart) async {
    database.insertCartEntry(cart.toEntity());
  }
}