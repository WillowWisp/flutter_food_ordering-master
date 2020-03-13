import 'package:flutter/foundation.dart';
import 'package:food_app_concept/core/dtos/cart_entry/cart_entry_input_dto.dart';
import 'package:food_app_concept/core/dtos/cart_entry/cart_entry_output_dto.dart';
import 'package:food_app_concept/core/interfaces/icart_entry_repository.dart';
import 'package:food_app_concept/locator.dart';

class CartEntryViewmodel extends ChangeNotifier {
  CartEntryViewmodel() {
    fetchAllCartEntryByUserId(0);
  }

  List<CartEntryOutputDto> _userCart = [];

  List<CartEntryOutputDto> get userCart => _userCart;

  Future fetchAllCartEntryByUserId(int userId) async {
    final cartEntryRepository = locator<ICartEntryRepository>();
    _userCart = await cartEntryRepository.getAllCartEntriesByUserId(userId);
    // print(_userCart[0].discountCode);
    notifyListeners();
  }

  Future insertFoodIntoCart(CartEntryInputDto cart) async {
    final cartEntryRepository = locator<ICartEntryRepository>();
    await cartEntryRepository.insertCartEntry(cart);
    fetchAllCartEntryByUserId(0); // TODO: temp
  }
}
