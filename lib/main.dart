import 'package:flutter/material.dart';
import 'package:hamburger_app/provider/provider.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Burger App',
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(
  //       primaryColor: kPrimaryColor,
  //       secondaryHeaderColor: Colors.white,
  //       textTheme: TextTheme(
  //           bodyText1: TextStyle(color: ksecondaryColor),
  //           bodyText2: TextStyle(color: ksecondaryColor),
  //       )
  //      ),
  //     home: HomeScreen(),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangeTheme()),
      ],
      child: Builder(builder: (context) {
        final changeTheme = Provider.of<ChangeTheme>(context);
        return MaterialApp(
          theme: changeTheme.isdarktheme ? ThemeData.dark() : ThemeData(
              primaryColor: kPrimaryColor,
              secondaryHeaderColor: Colors.white,
              textTheme: TextTheme(
                bodyText1: TextStyle(color: ksecondaryColor),
                bodyText2: TextStyle(color: ksecondaryColor),
              )
          ),
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          home: HomeScreen(),
        );
      }),
    );
  }
}

