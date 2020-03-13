
import 'package:food_app_concept/core/database/moor_database.dart';

class CartEntryDto {
  int id;
  int foodId;
  String notes;

  CartEntryDto({this.id, this.foodId, this.notes});

  factory CartEntryDto.fromEntity(CartEntryEntity entity) {
    return CartEntryDto(
      id: entity.id,
      foodId: entity.foodId,
      notes: entity.notes,
    );
  }
}