import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweettreat/models/product.dart';

import '../../../config/const.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Product>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
      ),
      width: double.infinity,
      height: 202,
      child: GridTile(
        footer: ClipRRect(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(11)),
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
                        product.title,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Consumer<Product>(
                                    builder: (((context, product, child) {
                                  return Column(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            product.toggleIsFavorite();
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: product.isFavorite
                                                ? Colors.red[300]
                                                : Colors.white,
                                          )),
                                      Text(product.favorite),
                                    ],
                                  );
                                }))),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.remove_red_eye),
                              Text(product.view),
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
            product.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
