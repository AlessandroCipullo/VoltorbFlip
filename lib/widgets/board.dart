import 'package:flutter/material.dart';

import '../utils/values.dart';
import 'tile.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<int> prevValues = [];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Values.status,
        builder: (context, value, child) {
          int countTiles = 0;
          List<int> generateValues = [];
          if (value == 0) {
            generateValues = Values.generateValues();
            prevValues = generateValues;
          } else {
            generateValues = prevValues;
          }
          return GridView.count(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            crossAxisCount: 6,
            children: List.generate(36, (index) {
              if (index == 35) {
                return const TutorialTile();
              }
              if (index > 29) {
                return ColInfoTiles(col: index - 29);
              }
              if (index == 5 ||
                  index == 11 ||
                  index == 17 ||
                  index == 23 ||
                  index == 29) {
                countTiles++;
                return RowInfoTiles(row: countTiles);
              } else {
                return Tile(
                    val: generateValues[index - countTiles],
                    index: index - countTiles);
              }
            }),
          );
        });
  }
}
