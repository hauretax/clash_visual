import 'dart:ffi';

class EpicCard {
  String name = '';
  num level = 0;
  String style = '';
  num count = 0;
  num totalCount = 0;
  num nextLevel = 0;
  num maxLevel = 0;
  List<num> stepr = [
    1,
    3,
    7,
    17,
    37,
    87,
    187,
    387,
    787,
    1587,
    2587,
    4087,
    7087,
    12087,
  ];

  EpicCard({
    name,
    level,
    count,
    maxLvl,
    style,
  }) {
    name = name;
    level = level;
    style = style;
    count = count;
    totalCount = stepr[level - 1] + count;
    nextLevel = (level == 14) ? 0 : stepr[level] - totalCount;
    maxLevel = stepr[maxLvl - 1] - totalCount;
  }
}
