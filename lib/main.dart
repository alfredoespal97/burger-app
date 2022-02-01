import 'package:flutter/material.dart';

import 'constants.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burger App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primaryColor: kPrimaryColor,
        secondaryHeaderColor: Colors.white,
        textTheme: TextTheme(
            bodyText1: TextStyle(color: ksecondaryColor),
            bodyText2: TextStyle(color: ksecondaryColor),
        )
      ),
      home: HomeScreen(),
    );
  }
}

