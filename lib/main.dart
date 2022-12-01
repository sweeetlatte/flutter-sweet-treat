import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweettreat/config/const.dart';
import 'package:sweettreat/pages/home/widgets/category.dart';
import 'package:sweettreat/pages/home/widgets/product.dart';
import 'package:sweettreat/pages/index.dart';
import 'package:sweettreat/providers/category_provider.dart';
import 'package:sweettreat/providers/product_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CategoryProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProductProvider(),
      ),
    ],
    child: MaterialApp(
      theme: ThemeData(backgroundColor: stPrimary),
      debugShowCheckedModeBanner: false,
      initialRoute: MyApp.routeName,
      routes: {
        MyApp.routeName: (context) => const MyApp(),
        CategoryPage.routeName: (context) => const CategoryPage(),
        ProductDetail.routeName: (context) => const ProductDetail(),
      },
    ),
  ));
}
