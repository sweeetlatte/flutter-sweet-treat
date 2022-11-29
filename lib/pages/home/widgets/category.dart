import 'package:flutter/material.dart';
import 'package:sweettreat/config/const.dart';
import 'package:sweettreat/pages/home/widgets/product.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = '/category';
  const CategoryPage({
    Key? key,
    // required this.title,
  }) : super(key: key);

  // final title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          // 'Category $title',
          'Category',
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
      body: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((_) => const ProductDetail())));
        },
        child: Container(
          color: stBackground,
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
            itemCount: 10,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 24,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Container(
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
                            const Flexible(
                                flex: 4,
                                child: Text(
                                  'sing a Flexible widget gives a child of a Row, Column, or Flex the flexibility to expand to fill the available space in the main a',
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
                                        children: const [
                                          Icon(Icons.favorite),
                                          Text('1234'),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.remove_red_eye),
                                        Text('4567'),
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
                      'assets/images/product/chocolate-strawberry-shortcake.webp',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
