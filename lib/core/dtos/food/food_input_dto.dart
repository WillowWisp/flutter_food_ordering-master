import 'package:food_app_concept/core/database/moor_database.dart';

class FoodInputDto {
  String name;
  String image;
  double price;

  FoodInputDto({this.name, this.image, this.price});

  // factory Food.fromJson(Map<String, dynamic> json) {
  //   return Food(
  //     id: json['id'],
  //     name: json['name'],
  //     image: json['image'],
  //     price: json['price'],
  //   );
  // }

  FoodEntity toEntity() {
    return FoodEntity(
      id: null,
      name: name,
      image: image,
      price: price,
    );
  }
}