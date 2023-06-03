import 'dart:math';

import 'package:flutter/material.dart';

class Values {
  static ValueNotifier<int> level = ValueNotifier(1);
  static ValueNotifier<int> totCoins = ValueNotifier(0);
  static ValueNotifier<int> lvlCoins = ValueNotifier(0);
  // 0 = playing, 1 = loss, 2 - won, 3 = restart
  static ValueNotifier<int> status = ValueNotifier(0);
  static ValueNotifier<bool> tutorial = ValueNotifier(false);
  static int seed = 0;
  static List<int> currValues = [];

  static void addCoins(int coins) {
    if (lvlCoins.value == 0) {
      lvlCoins.value += coins;
    } else {
      lvlCoins.value *= coins;
    }

    if (level.value == 1) {
      if (seed == 1 && lvlCoins.value == 24) {
        win();
      } else if (seed == 2 && lvlCoins.value == 27) {
        win();
      } else if (seed == 3 && lvlCoins.value == 32) {
        win();
      } else if (seed == 4 && lvlCoins.value == 36) {
        win();
      } else if (seed == 5 && lvlCoins.value == 48) {
        win();
      }
    } else if (level.value == 2) {
      if (seed == 1 && lvlCoins.value == 54) {
        win();
      } else if (seed == 2 && lvlCoins.value == 64) {
        win();
      } else if (seed == 3 && lvlCoins.value == 72) {
        win();
      } else if (seed == 4 && lvlCoins.value == 81) {
        win();
      } else if (seed == 5 && lvlCoins.value == 96) {
        win();
      }
    } else if (level.value == 3) {
      if (seed == 1 && lvlCoins.value == 108) {
        win();
      } else if (seed == 2 && lvlCoins.value == 128) {
        win();
      } else if (seed == 3 && lvlCoins.value == 144) {
        win();
      } else if (seed == 4 && lvlCoins.value == 162) {
        win();
      } else if (seed == 5 && lvlCoins.value == 192) {
        win();
      }
    } else if (level.value == 4) {
      if (seed == 1 && lvlCoins.value == 216) {
        win();
      } else if (seed == 2 && lvlCoins.value == 243) {
        win();
      } else if (seed == 3 && lvlCoins.value == 256) {
        win();
      } else if (seed == 4 && lvlCoins.value == 288) {
        win();
      } else if (seed == 5 && lvlCoins.value == 324) {
        win();
      }
    } else if (level.value == 5) {
      if (seed == 1 && lvlCoins.value == 384) {
        win();
      } else if (seed == 2 && lvlCoins.value == 432) {
        win();
      } else if (seed == 3 && lvlCoins.value == 486) {
        win();
      } else if (seed == 4 && lvlCoins.value == 512) {
        win();
      } else if (seed == 5 && lvlCoins.value == 576) {
        win();
      }
    } else if (level.value == 6) {
      if (seed == 1 && lvlCoins.value == 648) {
        win();
      } else if (seed == 2 && lvlCoins.value == 729) {
        win();
      } else if (seed == 3 && lvlCoins.value == 768) {
        win();
      } else if (seed == 4 && lvlCoins.value == 864) {
        win();
      } else if (seed == 5 && lvlCoins.value == 972) {
        win();
      }
    } else if (level.value == 7) {
      if (seed == 1 && lvlCoins.value == 1152) {
        win();
      } else if (seed == 2 && lvlCoins.value == 1296) {
        win();
      } else if (seed == 3 && lvlCoins.value == 1458) {
        win();
      } else if (seed == 4 && lvlCoins.value == 1536) {
        win();
      } else if (seed == 5 && lvlCoins.value == 1728) {
        win();
      }
    } else if (level.value == 8) {
      if (seed == 1 && lvlCoins.value == 2187) {
        win();
      } else if (seed == 2 && lvlCoins.value == 2304) {
        win();
      } else if (seed == 3 && lvlCoins.value == 2592) {
        win();
      } else if (seed == 4 && lvlCoins.value == 2916) {
        win();
      } else if (seed == 5 && lvlCoins.value == 3456) {
        win();
      }
    }
  }

  static void increaseLevel() {
    level.value++;
  }

  static String getLevelMsg() {
    int lvl = level.value;
    return "Level: $lvl \nStart!";
  }

  static String winMsg() {
    int lvlC = lvlCoins.value;
    return "Game Clear!\nYou received $lvlC Coins!";
  }

  static String lossMsg() {
    return "Oh no!\nYou got 0 coins!";
  }

  static void win() {
    status.value = 2;
    level.value++;
    totCoins.value += lvlCoins.value;
  }

  static void lose() {
    Random random = Random();

    status.value = 1;

    level.value = random.nextInt(level.value) + 1;
  }

  static void reFlip() {
    status.value = 3;
  }

  static void restart() {
    status.value = 0;
    lvlCoins.value = 0;
  }

  static void addTotCoins(int coins) {
    totCoins.value += coins;
  }

  static List<int> generateValues() {
    Random random = Random();
    seed = random.nextInt(5) + 1;
    late List<int> values = [];

    if (level.value == 1 && seed == 1) {
      values = [
        3,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 1 && seed == 2) {
      values = [
        3,
        3,
        3,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 1 && seed == 3) {
      values = [
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 1 && seed == 4) {
      values = [
        3,
        3,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 1 && seed == 5) {
      values = [
        3,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 2 && seed == 1) {
      values = [
        3,
        3,
        3,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 2 && seed == 2) {
      values = [
        2,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 2 && seed == 3) {
      values = [
        3,
        3,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 2 && seed == 4) {
      values = [
        3,
        3,
        3,
        3,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 2 && seed == 5) {
      values = [
        3,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 3 && seed == 1) {
      values = [
        3,
        3,
        3,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 3 && seed == 2) {
      values = [
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 3 && seed == 3) {
      values = [
        3,
        3,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 3 && seed == 4) {
      values = [
        3,
        3,
        3,
        3,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 3 && seed == 5) {
      values = [
        3,
        2,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 4 && seed == 1) {
      values = [
        3,
        3,
        3,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 4 && seed == 2) {
      values = [
        3,
        3,
        3,
        3,
        3,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 4 && seed == 3) {
      values = [
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 4 && seed == 4) {
      values = [
        3,
        3,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 4 && seed == 5) {
      values = [
        3,
        3,
        3,
        3,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 5 && seed == 1) {
      values = [
        3,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 5 && seed == 2) {
      values = [
        3,
        3,
        3,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 5 && seed == 3) {
      values = [
        3,
        3,
        3,
        3,
        3,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 5 && seed == 4) {
      values = [
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 5 && seed == 5) {
      values = [
        3,
        3,
        2,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 6 && seed == 1) {
      values = [
        3,
        3,
        3,
        3,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 6 && seed == 2) {
      values = [
        3,
        3,
        3,
        3,
        3,
        3,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 6 && seed == 3) {
      values = [
        3,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 6 && seed == 4) {
      values = [
        3,
        3,
        3,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 6 && seed == 5) {
      values = [
        3,
        3,
        3,
        3,
        3,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 7 && seed == 1) {
      values = [
        3,
        3,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 7 && seed == 2) {
      values = [
        3,
        3,
        3,
        3,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 7 && seed == 3) {
      values = [
        3,
        3,
        3,
        3,
        3,
        3,
        2,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 7 && seed == 4) {
      values = [
        3,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 7 && seed == 5) {
      values = [
        3,
        3,
        3,
        2,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 8 && seed == 1) {
      values = [
        3,
        3,
        3,
        3,
        3,
        3,
        3,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 8 && seed == 2) {
      values = [
        3,
        3,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 8 && seed == 3) {
      values = [
        3,
        3,
        3,
        3,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 8 && seed == 4) {
      values = [
        3,
        3,
        3,
        3,
        3,
        3,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    } else if (level.value == 8 && seed == 5) {
      values = [
        3,
        3,
        3,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      ];
    }

    values.shuffle();
    currValues = values;
    return values;
  }
}
