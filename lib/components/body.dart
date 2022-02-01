import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hamburger_app/constants.dart';

import 'search_box.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchBox(onChanged: (value){},),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CategoryItem(
                title: "Combo Meal",
                isActive: true,
              ),
              CategoryItem(
                title: "Chicken",
                isActive: false,
              ),
              CategoryItem(
                title: "Beverages",
                isActive: false,
              ),
              CategoryItem(
                title: "Snacks and Siders",
                isActive: false,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
   final bool isActive;
  // final Function press;
  const CategoryItem({Key? key, required this.title, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: <Widget>[
            Text(title,
              style: isActive ? TextStyle(
                  color: ktextColor,
                  fontWeight: FontWeight.bold
              ) :  TextStyle(fontSize: 12
              ),
            ),
            if (isActive)
            Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 3,
                width: 22,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ],
        ),
      ),
    );
  }
}


