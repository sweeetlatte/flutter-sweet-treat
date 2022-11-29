import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweettreat/config/const.dart';
import 'package:sweettreat/pages/home/widgets/product.dart';
import 'package:sweettreat/providers/category_provider.dart';
import 'package:sweettreat/providers/product_provider.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = '/category';
  CategoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                ),
                width: double.infinity,
                height: 200,
                child: GridTile(
                  footer: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(bottom: Radius.circular(9)),
                    child: Container(
                      height: 65,
                      alignment: Alignment.center,
                      color: stPrimaryVariant,
                      child: GridTileBar(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                                flex: 4,
                                child: Text(
                                  products[index].title,
                                  maxLines: 2,
                                  style: styleTitleBlack,
                                )),
                            Flexible(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.favorite),
                                          Text(products[index].favorite),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.remove_red_eye),
                                        Text(products[index].view),
                                      ],
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Image.asset(
                      products[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
