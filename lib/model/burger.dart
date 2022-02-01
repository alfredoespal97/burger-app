import 'dart:core';

class Burger {
  late int id;
  late String name;
  late String image;
  late String restaurant;
  late String description;
  late List<String> ingredients;


  Burger(int id, String name, String image, String restaurant, String description, List<String> ingredients) {
    this.id = id;
    this.name = name;
    this.image = image;
    this.restaurant = restaurant;
    this.description = description;
    this.ingredients = ingredients;
  }


}
