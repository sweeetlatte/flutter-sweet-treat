import 'package:flutter/material.dart';
import 'package:sweettreat/config/const.dart';
import 'package:sweettreat/pages/home/widgets/category.dart';

import '../../providers/category_provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CategoryProvider().readJson(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          var categoryItem = snapshot.hasData ? snapshot.data : [];

          return snapshot.hasData
              ? GridView.builder(
                  padding: const EdgeInsets.fromLTRB(18, 10, 18, 0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                  ),
                  itemCount: categoryItem?.length,
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
                          arguments: {
                            "title": categoryItem[index].name,
                            "categoryId": categoryItem[index].id,
                          },
                        );
                      },
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage(categoryItem![index].image),
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.only(top: 10),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  categoryItem[index].name,
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  style: styleTitleBlack,
                                ),
                              )),
                        ],
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text('No categories found'),
                );
        });
  }
}
