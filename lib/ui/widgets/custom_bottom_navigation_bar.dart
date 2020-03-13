import 'package:flutter/material.dart';

class CustomBottomNavigatorBar extends StatelessWidget {
  const CustomBottomNavigatorBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "images/home.png",
                width: 28,
                height: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "images/target.png",
                width: 28,
                height: 28,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "images/shopping-bag.png",
                width: 28,
                height: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "images/avatar.png",
                width: 28,
                height: 28,
              ),
            ),

          ],
        ),
      );
  }
}