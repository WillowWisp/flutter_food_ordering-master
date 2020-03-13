import 'package:flutter/material.dart';
import 'package:food_app_concept/core/viewmodels/food_viewmodel.dart';
import 'package:food_app_concept/ui/widgets/small_floating_button.dart';
import 'package:provider/provider.dart';

// List<Food> foodList = [
//   Food(name: "Cereals",
//       image: "1.jpg",
//       price: 5.99),
//   Food(name: "Massala",
//   image: "3.jpg",
//   price: 13.99),
//   Food(name: "Taccos",
//       image: "5.jpg",
//       price: 3.72),
//   Food(name: "Cereals",
//       image: "1.jpg",
//       price: 5.99),
// ];

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: Consumer<FoodViewmodel>(
        builder: (_, foodViewmodel, __) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodViewmodel.foodList.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.red[50],
                              offset: Offset(3, 8),
                              blurRadius: 15)
                          ]),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            "images/${foodViewmodel.foodList[index].image}",
                            width: 140,
                            height: 140,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(foodViewmodel.foodList[index].name),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey[200], offset: Offset(2, 5), blurRadius: 7),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add_shopping_cart,
                                    size: 12,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "4.5",
                                      style: TextStyle(color: Colors.grey, fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Icon(Icons.star,color: Colors.red,size: 14,),
                                    Icon(Icons.star,color: Colors.red,size: 14,),
                                    Icon(Icons.star,color: Colors.red,size: 14,),
                                    Icon(Icons.star,color: Colors.red,size: 14,),
                                    Icon(Icons.star,color: Colors.grey,size: 14,),
                                    SizedBox(width: 3),
                                    Text(
                                      "(10)",
                                      style: TextStyle(color: Colors.grey, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "\$${foodViewmodel.foodList[index].price}",
                                  style: TextStyle(color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
        },
      ),
    );
  }
}