import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweettreat/config/const.dart';

import '../../../providers/product_provider.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});
  static const routeName = '/product';

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    bool change = true;
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    var product =
        Provider.of<ProductProvider>(context).getItemWithId(arguments['id']);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(product.image),
                fit: BoxFit.cover,
              )),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
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
                        decoration: const BoxDecoration(
                          color: stBackground,
                          borderRadius: BorderRadius.all(Radius.circular(999)),
                        ),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          size: 30.0,
                          color: stPrimary,
                        ),
                      ),
                    ),
                  ),
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
                            InkWell(
                              onTap: () {
                                product.toggleIsFavorite();
                                setState(() {
                                  change = !change;
                                });
                              },
                              child: Icon(
                                Icons.favorite,
                                color:
                                    product.isFavorite ? stPrimary : stNeutral2,
                              ),
                            ),
                            const SizedBox(width: 7),
                            Text(product.favorite),
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
                            Text(product.view),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        product.title,
                        style: const TextStyle(color: stPrimary, fontSize: 20),
                      )),
                  Text(
                    product.intro,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(bottom: 6),
                        child: const Text(
                          'Ingredients',
                          style: TextStyle(
                            fontSize: 16,
                            color: stPrimary,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(product.ingredients),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(bottom: 6),
                        child: const Text(
                          'Directions',
                          style: TextStyle(
                            fontSize: 16,
                            color: stPrimary,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(product.instructions),
                      )
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
