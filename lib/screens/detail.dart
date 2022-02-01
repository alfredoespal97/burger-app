import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hamburger_app/constants.dart';
import 'package:hamburger_app/model/burger.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatelessWidget {
  final Burger burger;
  const DetailScreen(this.burger, {Key? key}) : super(key: key);

  List<Widget> ingredientes() {
    List<Widget> res = [];
    for (int i = 0; i < burger.ingredients.length; i++) {
      res.add(Text(burger.ingredients[i]));
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: kPrimaryColor,
            pinned: true,
            snap: true,
            floating: true,
            forceElevated: true,
            expandedHeight: height / 3,
            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60))),
            flexibleSpace: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Image.network(
                      burger.image,
                      fit: BoxFit.cover,
                    ))
              ],
            ),
          ),
          // If the main content is a list, use SliverList instead.
          SliverFillRemaining(
              child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, verticalDirection: VerticalDirection.down, children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.location_on,
                              color: ksecondaryColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(burger.restaurant, style: TextStyle(color: ksecondaryColor))
                          ],
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: ingredientes()),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          burger.description,
                          style: TextStyle(fontSize: 20, color: ksecondaryColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ])),
        ],
      ),
    );
  }
}
