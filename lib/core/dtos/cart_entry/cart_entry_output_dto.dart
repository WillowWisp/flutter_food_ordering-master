import 'package:food_app_concept/core/database/moor_database.dart';
import 'package:food_app_concept/core/dtos/food/food_dto.dart';

import 'cart_entry_dto.dart';

class CartEntryOutputDto {
  CartEntryDto cartEntryDto;
  FoodDto food;

  CartEntryOutputDto({ this.cartEntryDto, this.food });

  factory CartEntryOutputDto.fromEntities(CartEntryEntity cartEntryEntity, FoodEntity foodEntity,) {
    return CartEntryOutputDto(
      cartEntryDto: CartEntryDto.fromEntity(cartEntryEntity),
      food: FoodDto.fromEntity(foodEntity),
    );
  }
}