import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweettreat/config/const.dart';
import 'package:sweettreat/providers/product_provider.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = Provider.of<ProductProvider>(context).getItemsIsFavorite();

    return Container(
      color: stBackground,
      child: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            onDismissed: (direction) {
              items[index].handleRemoveIsFavorite();
            },
            key: ValueKey<int>(index),
            child: Container(
              width: double.infinity,
              height: 180,
              padding: const EdgeInsets.only(bottom: 18),
              child: GridTile(
                footer: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(9)),
                  child: Container(
                    color: stPrimaryVariant,
                    child: GridTileBar(
                      title: Text(
                        items[index].title,
                        style: styleTitleBlack,
                      ),
                      trailing: const Icon(
                        Icons.swipe,
                        size: sizeIconButton,
                      ),
                    ),
                  ),
                ),
                child: Container(
                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(items[index].image),
                  ),
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}
