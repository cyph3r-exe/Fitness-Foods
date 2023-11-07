import 'package:flutter/material.dart';

class PopularDietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;
  Color boxColor;

  PopularDietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected,
    required this.boxColor

  });

  static List<PopularDietModel> getPopularDiets() {
    List <PopularDietModel> populardiets = [];

    populardiets.add(PopularDietModel(
      name: 'Blueberry Pancake',
      iconPath: 'assets/icons/blueberry-pancakes.svg',
      level: 'Easy',
      duration: '20mins',
      calorie: '230kcal',
      boxColor: const Color(0xffC58BF2),
      boxIsSelected: false));

    populardiets.add(PopularDietModel(
      name: 'Salmon Ngiri',
      iconPath: 'assets/icons/salmon-ngiri.svg',
      level: 'Medium',
      duration: '10mins',
      calorie: '180kcal',
      boxColor: const Color(0xff92A3FD),
      boxIsSelected: false));

      return populardiets;
  }
}