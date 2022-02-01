
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

AppBar homeAppBar(BuildContext context){
  return AppBar(
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
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: ()=>{

      },
    ),
    actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.refresh,color: kPrimaryColor,))
    ],
  );
}