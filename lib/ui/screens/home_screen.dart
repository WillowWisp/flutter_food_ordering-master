import 'package:flutter/material.dart';
import 'package:food_app_concept/ui/widgets/categories.dart';
import 'package:food_app_concept/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:food_app_concept/ui/widgets/popular_food.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "What would you like to eat?",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.notifications_none),
                      onPressed: () {
                        Navigator.pushNamed(context, '/food-manage');
                      }
                    ),
                    Positioned(
                      top: 10,
                      right: 12,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.red, borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300], offset: Offset(2, 1), blurRadius: 5)
                    ]),
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.red,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "Find food or Restuarant",
                        border: InputBorder.none),
                  ),
                  trailing: Icon(
                    Icons.filter_list,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Categories(),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Popular food",
                style: TextStyle(fontSize: 22, color: Colors.grey),
              ),
            ),
            Popular(),

          ],
        )
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }
}
