
import 'package:food_app_concept/core/dtos/cart_entry/cart_entry_input_dto.dart';
import 'package:food_app_concept/core/dtos/cart_entry/cart_entry_output_dto.dart';

abstract class ICartEntryRepository {
  Future<List<CartEntryOutputDto>> getAllCartEntriesByUserId(int userId);
  Future<void> insertCartEntry(CartEntryInputDto cart);
}