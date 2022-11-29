import 'package:flutter/material.dart';
import 'package:sweettreat/config/const.dart';
import 'package:sweettreat/pages/home/widgets/category.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(18, 10, 18, 0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
      ),
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: ((_) => CategoryPage(title: index))));
            Navigator.pushNamed(
              context,
              CategoryPage.routeName,
              arguments: {"title": index},
            );
          },
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: stPrimary,
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/images/product/chocolate-strawberry-shortcake.webp'),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Title',
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: styleTitleBlack,
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
