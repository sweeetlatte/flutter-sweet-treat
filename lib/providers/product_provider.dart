import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:sweettreat/models/product.dart';

class CategoryProvider extends ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items => [...items];

  Future<List<Product>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/product.json');
    final dataDecode = await json.decode(response);

    List<Product> data = List<Product>.from(
        dataDecode.map((i) => Product.fromJson(jsonEncode(i))));

    _items = data;
    return data;
  }
}
