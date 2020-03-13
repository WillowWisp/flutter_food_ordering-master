import 'package:food_app_concept/core/database/moor_database.dart';

class FoodDto {
  final int id;
  final String name;
  final String image;
  final double price;

  FoodDto({this.id, this.name, this.image, this.price});

  factory FoodDto.fromMap(Map<String, dynamic> map) {
    return FoodDto(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      price: map['price'],
    );
  }

  factory FoodDto.fromEntity(FoodEntity entity) {
    return FoodDto(
      id: entity.id,
      name: entity.name,
      image: entity.image,
      price: entity.price,
    );
  }
}