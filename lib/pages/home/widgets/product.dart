import 'package:flutter/material.dart';
import 'package:sweettreat/config/const.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: const Text(
          'Sweet Treat',
          style: TextStyle(
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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                    'assets/images/chocolate-strawberry-shortcake.webp'),
                fit: BoxFit.cover,
              )),
              child: Row(
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
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  const Text(
                      'Bake on center rack until custard is set and top has a thin white sugary crust, 25 minutes. Let cool completely before cutting into bars. Dip knife into very hot water, run around the edge, and cut into 16 squares. Dust cookies with 1 teaspoon confectioners sugar.'),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 167,
                        height: 35,
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(9)),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Ingredients',
                          style: styleTitlePrimary,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: stPrimaryVariant,
                        child: const Text(''),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 167,
                        height: 35,
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(9)),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Directions',
                          style: styleTitlePrimary,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: stPrimaryVariant,
                        child: const Text(''),
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
