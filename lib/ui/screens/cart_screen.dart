import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_app_concept/core/viewmodels/cart_entry_viewmodel.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart')
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Consumer<CartEntryViewmodel>(
                builder: (_, cartEntryViewmodel, __) {
                  return ListView.builder(
                    itemCount: cartEntryViewmodel.userCart.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Delete',
                              color: Colors.redAccent,
                              icon: Icons.remove_shopping_cart,
                              onTap: () {},
                            ),
                          ],
                          child: Container(
                            // height: 50,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // borderRadius: BorderRadius.circular(8),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.red[50],
                              //     offset: Offset(3, 8),
                              //     blurRadius: 15,
                              //   ),
                              // ],
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      "images/${cartEntryViewmodel.userCart[index].food.image}",
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center,
                                      width: 115,
                                      height: 115,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              cartEntryViewmodel.userCart[index].food.name,
                                              style: TextStyle(
                                                // color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              'Notes: ${cartEntryViewmodel.userCart[index].cartEntryDto.notes}',
                                              style: TextStyle(
                                                // color: Colors.grey[200],
                                                fontSize: 14,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Text(
                                              '\$${cartEntryViewmodel.userCart[index].food.price.toString()}',
                                              style: TextStyle(
                                                // color: Colors.white,
                                                fontSize: 18,
                                                // fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } ,
              ),
            )
          )
        ],
      )
    );
  }
}