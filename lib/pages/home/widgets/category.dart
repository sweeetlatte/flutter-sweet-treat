import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweettreat/config/const.dart';
import 'package:sweettreat/models/product.dart';
import 'package:sweettreat/pages/home/widgets/category_body.dart';
import 'package:sweettreat/pages/home/widgets/product.dart';
import 'package:sweettreat/providers/product_provider.dart';

class CategoryPage extends StatefulWidget {
  static const routeName = '/category';
  CategoryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    bool change = true;
    final data = ModalRoute.of(context)?.settings.arguments as Map;
    var products = Provider.of<ProductProvider>(context)
        .getItemsWithCategoryId(data['categoryId']);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          data['title'],
          style: const TextStyle(
              color: stPrimary,
              fontWeight: FontWeight.w400,
              fontSize: 20,
              letterSpacing: 1),
        ),
        backgroundColor: stBackground,
        iconTheme: const IconThemeData(
          color: stPrimary,
        ),
        elevation: 0,
      ),
      body: Container(
        color: stBackground,
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
          itemCount: products.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 24,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, ProductDetail.routeName,
                    arguments: {
                      'id': products[index].id,
                    });
                products[index].updateView();
                setState(() {
                  change = !change;
                });
              },
              child: ChangeNotifierProvider<Product>.value(
                value: products[index],
                child: const CategoryBody(),
              ),
            );
          },
        ),
      ),
    );
  }
}
