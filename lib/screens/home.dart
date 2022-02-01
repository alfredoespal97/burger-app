import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hamburger_app/components/card.dart';
import 'package:hamburger_app/screens/detail.dart';
import 'package:hamburger_app/screens/information.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hamburger_app/components/app_bar.dart';
import 'package:hamburger_app/components/body.dart';
import 'package:hamburger_app/constants.dart';
import 'package:hamburger_app/model/burger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  List? burgers;
  late Burger burger = Burger(
      0,
      "name",
      "image",
      "restaurant",
      "description",
      [
        "beef"
      ],
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      fetchBurgerData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var width=size.width;
    var height=size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(text: TextSpan(
            style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold,),
            children: const [
              TextSpan(text: "Burger",style: TextStyle(color: ksecondaryColor)),
              TextSpan(text: "Shop",style: TextStyle(color: kPrimaryColor))
            ]),

        ),
        leading: IconButton(
          icon: Icon(Icons.info,color:kPrimaryColor),
          onPressed: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context) => InformationScreen()));
          },
        ),
        actions: [
          IconButton(onPressed: fetchBurgerData, icon: Icon(Icons.refresh,color: kPrimaryColor,))
        ],
      ),
      body: Center(
          child: burgers != null
              ? Column(
                children: [
                  Expanded(
            child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                    ),
                    itemCount: burgers?.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          assignBurger(i);
                          Navigator.push(context, new MaterialPageRoute(builder: (context) => DetailScreen(burger)));
                        },
                        child: CardItem(name: burgers![i]['name'],image: burgers![i]['image'])
                        // Container(
                        //   height: 250.0,
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //         color: Colors.black,
                        //         borderRadius: const BorderRadius.all(Radius.circular(20)),
                        //       ),
                        //       child: Hero(
                        //         tag: 'img',
                        //         child: ClipRRect(
                        //           borderRadius: BorderRadius.all(Radius.circular(15)),
                        //           child: CachedNetworkImage(
                        //             imageUrl: burgers![i]['image'],
                        //             fit: BoxFit.fill,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      );
                    }),
          ),
                ],
              )
              : const Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          )),
    );
  }

  //Funcion para llamar datos de las hamburguesas
  void fetchBurgerData() async {
    var url = Uri.https("raw.githubusercontent.com", "/alfredoespal97/api-hamburguesas/main/db.json");
    await http.get(url).then((value) {
      print(value.statusCode);
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        burgers = decodedJsonData['burgers'];
        setState(() {});
      } else {
        print('Request failed with status: ${value.statusCode}.');
      }
    });
  }

  //llenar el objeto hambuerguesa
  void assignBurger(int index) {
    burger.id = burgers![index]['id'];
    burger.name = burgers![index]['name'];
    burger.image = burgers![index]['image'];
    burger.restaurant = burgers![index]['restaurant'];
    burger.description = burgers![index]['description'];
    List t = burgers![index]['ingredients'];
    for (int i = 0; i < t.length; i++) {
      burger.ingredients.add(t.elementAt(i));
    }
  }
}




