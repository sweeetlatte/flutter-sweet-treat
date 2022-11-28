import 'package:flutter/material.dart';
import 'package:sweettreat/config/const.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
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
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(9)),
                    color: stBackground,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: stPrimary,
                      ),
                      SizedBox(width: 7),
                      Text('1234'),
                    ],
                  ),
                ),
                Container(
                  width: 85,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(9)),
                    color: stBackground,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        color: stPrimary,
                      ),
                      SizedBox(width: 7),
                      Text('1234'),
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
            padding: EdgeInsets.all(18),
            child: Column(
              children: [
                Text(
                    'Bake on center rack until custard is set and top has a thin white sugary crust, 25 minutes. Let cool completely before cutting into bars. Dip knife into very hot water, run around the edge, and cut into 16 squares. Dust cookies with 1 teaspoon confectioners sugar.'),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      width: 167,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(9)),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Ingredients',
                        style: styleTitlePrimary,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: stPrimaryVariant,
                      child: Text(''),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      width: 167,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(9)),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Directions',
                        style: styleTitlePrimary,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: stPrimaryVariant,
                      child: Text(''),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
