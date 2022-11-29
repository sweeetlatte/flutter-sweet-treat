import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweettreat/config/const.dart';

import '../../../providers/product_provider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});
  static const routeName = '/product';

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    var products = Provider.of<ProductProvider>(context)
        .getItemsWithCategoryId(arguments['categoryId']);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                    'assets/images/product/chocolate-strawberry-shortcake.webp'),
                fit: BoxFit.cover,
              )),
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Positioned(
                    top: 75,
                    left: 10,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: stBackground,
                            borderRadius:
                                BorderRadius.all(Radius.circular(999))),
                        child: Icon(
                          Icons.keyboard_arrow_left_rounded,
                          size: 30.0,
                          color: stPrimary,
                        ),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 85,
                      height: 36,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(9)),
                        color: stBackground,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: stPrimary,
                          ),
                          const SizedBox(width: 7),
                          const Text('1234'),
                        ],
                      ),
                    ),
                    Container(
                      width: 85,
                      height: 36,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(9)),
                        color: stBackground,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.remove_red_eye,
                            color: stPrimary,
                          ),
                          const SizedBox(width: 7),
                          const Text('1234'),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(bottom: 12),
                      child: Text(
                        'Title',
                        style: TextStyle(color: stPrimary, fontSize: 20),
                      )),
                  const Text(
                    'Bake on center rack until custard is set and top has a thin white sugary crust, 25 minutes. Let cool completely before cutting into bars. Dip knife into very hot water, run around the edge, and cut into 16 squares. Dust cookies with 1 teaspoon confectioners sugar.',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(bottom: 6),
                        child: Text(
                          'Ingredients',
                          style: TextStyle(
                            fontSize: 16,
                            color: stPrimary,
                          ),
                        ),
                      ),
                      Text(
                        'Bake on center rack until custard is set and top has a thin white sugary crust, 25 minutes. Let cool completely before cutting into bars. Dip knife into very hot water, run around the edge, and cut into 16 squares. Dust cookies with 1 teaspoon confectioners sugar.',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(bottom: 6),
                        child: Text(
                          'Directions',
                          style: TextStyle(
                            fontSize: 16,
                            color: stPrimary,
                          ),
                        ),
                      ),
                      Text(
                        'Bake on center rack until custard is set and top has a thin white sugary crust, 25 minutes. Let cool completely before cutting into bars. Dip knife into very hot water, run around the edge, and cut into 16 squares. Dust cookies with 1 teaspoon confectioners sugar.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
