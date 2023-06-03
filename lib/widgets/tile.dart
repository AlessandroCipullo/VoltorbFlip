import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/values.dart';

class Tile extends StatefulWidget {
  const Tile({super.key, required this.val, required this.index});
  final int val;
  final int index;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  bool isFlipped = false;
  late bool isVoltorb = isVoltorbFun(widget.val); // ?
  late int row = getRow(widget.index);
  late int col = getCol(widget.index);

  int getRow(int index) {
    if (index == 0 || index == 1 || index == 2 || index == 3 || index == 4) {
      return 1;
    }
    if (index == 5 || index == 6 || index == 7 || index == 8 || index == 9) {
      return 2;
    }
    if (index == 10 ||
        index == 11 ||
        index == 12 ||
        index == 13 ||
        index == 14) {
      return 3;
    }
    if (index == 15 ||
        index == 16 ||
        index == 17 ||
        index == 18 ||
        index == 19) {
      return 4;
    }
    if (index == 20 ||
        index == 21 ||
        index == 22 ||
        index == 23 ||
        index == 24) {
      return 5;
    } else {
      return 0;
    }
  }

  int getCol(int index) {
    if (index == 0 || index == 5 || index == 10 || index == 15 || index == 20) {
      return 1;
    }
    if (index == 1 || index == 6 || index == 11 || index == 16 || index == 21) {
      return 2;
    }
    if (index == 2 || index == 7 || index == 12 || index == 17 || index == 22) {
      return 3;
    }
    if (index == 3 || index == 8 || index == 13 || index == 18 || index == 23) {
      return 4;
    }
    if (index == 4 || index == 9 || index == 14 || index == 19 || index == 24) {
      return 5;
    } else {
      return 0;
    }
  }

  bool isVoltorbFun(int val) {
    return val == 0 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => setState(() {
              if (Values.status.value != 3) {
                if (isFlipped == false) {
                  Values.addCoins(widget.val);
                }
                isFlipped = true;
                if (isVoltorb) {
                  Values.lose();
                }
              }
            }),
        child: ValueListenableBuilder(
            valueListenable: Values.status,
            builder: (context, value, child) {
              if (value == 3) {
                isFlipped = false;
              }
              if (value == 1 || value == 2) {
                isFlipped = true;
              }
              if (value == 0) {
                isVoltorb = isVoltorbFun(widget.val);
              }

              return Container(
                  decoration: isFlipped == false
                      ? BoxDecoration(
                          border: Border.all(color: Colors.white),
                          image: const DecorationImage(
                              image: AssetImage('assets/tilesBack.png'),
                              fit: BoxFit.fill))
                      : BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: const Color.fromRGBO(14, 17, 17, 1)),
                  child: widget.val == 0 && isFlipped == true
                      ? Image.asset('assets/voltorb.png', fit: BoxFit.fill)
                      : Visibility(
                          visible: isFlipped == false ? false : true,
                          child: Center(
                              child: Text(
                                  style: GoogleFonts.robotoSlab(
                                      textStyle: const TextStyle(
                                          color: Colors.white, fontSize: 25)),
                                  widget.val.toString()))));
            }));
  }
}

class ColInfoTiles extends StatefulWidget {
  const ColInfoTiles({super.key, required this.col});
  final int col;

  @override
  State<ColInfoTiles> createState() => _ColInfoTilesState();
}

class _ColInfoTilesState extends State<ColInfoTiles> {
  String prevInfos = "";

  int getTotPointsCol(int col) {
    int totPoints = 0;

    if (col == 1) {
      for (int i = 0; i < 21; i += 5) {
        totPoints += Values.currValues[i];
      }
    } else if (col == 2) {
      for (int i = 1; i < 22; i += 5) {
        totPoints += Values.currValues[i];
      }
    } else if (col == 3) {
      for (int i = 2; i < 23; i += 5) {
        totPoints += Values.currValues[i];
      }
    } else if (col == 4) {
      for (int i = 3; i < 24; i += 5) {
        totPoints += Values.currValues[i];
      }
    } else if (col == 5) {
      for (int i = 4; i < 25; i += 5) {
        totPoints += Values.currValues[i];
      }
    }
    return totPoints;
  }

  int getTotVoltorbCol(int col) {
    int totVoltorb = 0;

    if (col == 1) {
      for (int i = 0; i < 21; i += 5) {
        if (Values.currValues[i] == 0) {
          totVoltorb++;
        }
      }
    } else if (col == 2) {
      for (int i = 1; i < 22; i += 5) {
        if (Values.currValues[i] == 0) {
          totVoltorb++;
        }
      }
    } else if (col == 3) {
      for (int i = 2; i < 23; i += 5) {
        if (Values.currValues[i] == 0) {
          totVoltorb++;
        }
      }
    } else if (col == 4) {
      for (int i = 3; i < 24; i += 5) {
        if (Values.currValues[i] == 0) {
          totVoltorb++;
        }
      }
    } else if (col == 5) {
      for (int i = 4; i < 25; i += 5) {
        if (Values.currValues[i] == 0) {
          totVoltorb++;
        }
      }
    }
    return totVoltorb;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Values.status,
      builder: (context, value, child) {
        int coins = getTotPointsCol(widget.col);
        int voltorb = getTotVoltorbCol(widget.col);
        String infos = "";
        if (value == 0) {
          infos = "C: $coins\nV: $voltorb";
          prevInfos = infos;
        } else {
          infos = prevInfos;
        }

        return Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(14, 17, 17, 1),
          ),
          child: Center(
              child: Text(
            infos,
            style: GoogleFonts.robotoSlab(
                textStyle: const TextStyle(color: Colors.white, fontSize: 17)),
          )),
        );
      },
    );
  }
}

class RowInfoTiles extends StatefulWidget {
  const RowInfoTiles({super.key, required this.row});
  final int row;

  @override
  State<RowInfoTiles> createState() => _RowInfoTilesState();
}

class _RowInfoTilesState extends State<RowInfoTiles> {
  String prevInfos = "";

  int getTotPointsRow(int row) {
    int totPoints = 0;

    if (row == 1) {
      for (int i = 0; i < 5; i++) {
        totPoints += Values.currValues[i];
      }
    } else if (row == 2) {
      for (int i = 5; i < 10; i++) {
        totPoints += Values.currValues[i];
      }
    } else if (row == 3) {
      for (int i = 10; i < 15; i++) {
        totPoints += Values.currValues[i];
      }
    } else if (row == 4) {
      for (int i = 15; i < 20; i++) {
        totPoints += Values.currValues[i];
      }
    } else if (row == 5) {
      for (int i = 20; i < 25; i++) {
        totPoints += Values.currValues[i];
      }
    }
    return totPoints;
  }

  int getTotVoltorbRow(int row) {
    int totVoltorb = 0;

    if (row == 1) {
      for (int i = 0; i < 5; i++) {
        if (Values.currValues[i] == 0) {
          totVoltorb++;
        }
      }
    } else if (row == 2) {
      for (int i = 5; i < 10; i++) {
        if (Values.currValues[i] == 0) {
          totVoltorb++;
        }
      }
    } else if (row == 3) {
      for (int i = 10; i < 15; i++) {
        if (Values.currValues[i] == 0) {
          totVoltorb++;
        }
      }
    } else if (row == 4) {
      for (int i = 15; i < 20; i++) {
        if (Values.currValues[i] == 0) {
          totVoltorb++;
        }
      }
    } else if (row == 5) {
      for (int i = 20; i < 25; i++) {
        if (Values.currValues[i] == 0) {
          totVoltorb++;
        }
      }
    }
    return totVoltorb;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Values.status,
      builder: (context, value, child) {
        int coins = getTotPointsRow(widget.row);
        int voltorb = getTotVoltorbRow(widget.row);
        String infos = "";
        if (value == 0) {
          infos = "C: $coins\nV: $voltorb";
          prevInfos = infos;
        } else {
          infos = prevInfos;
        }

        return Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(14, 17, 17, 1),
          ),
          child: Center(
              child: Text(
            infos,
            style: GoogleFonts.robotoSlab(
                textStyle: const TextStyle(color: Colors.white, fontSize: 17)),
          )),
        );
      },
    );
  }
}

class TutorialTile extends StatelessWidget {
  const TutorialTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Values.status.value == 0) {
          Values.tutorial.value = true;
        }
      },
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
              image: const DecorationImage(
                  image: AssetImage('assets/tutorial_tile.jpg'),
                  fit: BoxFit.fill))),
    );
  }
}
