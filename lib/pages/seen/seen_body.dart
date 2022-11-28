import 'package:flutter/material.dart';
import 'package:sweettreat/config/const.dart';

class SeenBody extends StatelessWidget {
  const SeenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
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
                  child: const GridTileBar(
                    title: Text(
                      'data',
                      style: styleTitleBlack,
                    ),
                    trailing: Icon(
                      Icons.swipe,
                      size: sizeIconButton,
                    ),
                  ),
                ),
              ),
              child: Container(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/images/chocolate-strawberry-shortcake.webp'),
                ),
              )),
            ),
          ),
        );
      },
    );
  }
}
