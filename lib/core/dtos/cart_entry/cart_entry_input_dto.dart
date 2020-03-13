import 'package:food_app_concept/core/database/moor_database.dart';

class CartEntryInputDto {
  int foodId;
  String notes;

  CartEntryInputDto({ this.foodId, this.notes });

  CartEntryEntity toEntity() {
    return CartEntryEntity(
      id: null,
      foodId: this.foodId,
      notes: this.notes,
    );
  }
}