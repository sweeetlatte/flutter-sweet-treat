import 'package:flutter/material.dart';
import 'package:sweettreat/config/const.dart';
import 'package:sweettreat/pages/home/widgets/category.dart';
import 'package:sweettreat/pages/index.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(backgroundColor: stPrimary),
    debugShowCheckedModeBanner: false,
    initialRoute: MyApp.routeName,
    routes: {
      MyApp.routeName: (context) => MyApp(),
      CategoryPage.routeName: (context) => CategoryPage(),
    },
  ));
}
