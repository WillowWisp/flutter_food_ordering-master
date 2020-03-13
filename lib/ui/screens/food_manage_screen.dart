import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app_concept/core/dtos/cart_entry/cart_entry_input_dto.dart';
import 'package:food_app_concept/core/dtos/food/food_input_dto.dart';
import 'package:food_app_concept/core/viewmodels/cart_entry_viewmodel.dart';
import 'package:food_app_concept/core/viewmodels/food_viewmodel.dart';
import 'package:provider/provider.dart';

class FoodManageScreen extends StatefulWidget {
  FoodManageScreen({Key key}) : super(key: key);

  @override
  _FoodManageScreenState createState() => _FoodManageScreenState();
}

class _FoodManageScreenState extends State<FoodManageScreen> {
  FoodInputDto _foodInput = new FoodInputDto(name: '', image: '', price: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Managing'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/my-cart');
            },
            icon: Stack(
              children: <Widget>[
                Icon(Icons.shopping_cart),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Consumer<CartEntryViewmodel>(
                        builder: (_, cartViewModel, __) {
                          return Text(
                            cartViewModel.userCart.length.toString(),
                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
              onChanged: (String value) {
                _foodInput.name = value;
              },
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Image',
              ),
              onChanged: (String value) {
                _foodInput.image = value;
              },
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Price',
              ),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                _foodInput.price = double.tryParse(value);
              },
            ),
            SizedBox(height: 15),
            RaisedButton(
              onPressed: () {
                var foodViewmodel = Provider.of<FoodViewmodel>(context, listen: false);
                foodViewmodel.insertFood(_foodInput);
              },
              child: Text('Insert Food'),
            ),
            Expanded(
              child: Consumer<FoodViewmodel>(
                builder: (_, foodViewmodel, __) {
                  print(foodViewmodel.foodList);
                  return ListView.builder(
                    itemCount: foodViewmodel.foodList.length,
                    itemBuilder: (_, index) {
                      return Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              'id: ${foodViewmodel.foodList[index].id}; image: ${foodViewmodel.foodList[index].image}; price: ${foodViewmodel.foodList[index].price}'
                            ),
                            RaisedButton.icon(
                              onPressed: () async {
                                var cartEntryViewmodel = Provider.of<CartEntryViewmodel>(context, listen: false);
                                await cartEntryViewmodel.insertFoodIntoCart(
                                  CartEntryInputDto(
                                    foodId: foodViewmodel.foodList[index].id,
                                    notes: 'không bỏ ớt',
                                  )
                                );
                              },
                              icon: Icon(Icons.add_shopping_cart),
                              label: Text('Add to Cart')
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              ),
            )
          ],
        )
      )
    );
  }
}