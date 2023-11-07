import 'package:flutter/material.dart';

class CategoryModal {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModal({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  }
  );
  static List<CategoryModal> getCategories() {
    List<CategoryModal> categories = [];
    categories.add(
      CategoryModal(
        name: 'Salad', 
        iconPath: 'assets/icons/plate.svg', 
        boxColor: const Color(0xff92A3FD))
    );
    categories.add(
      CategoryModal(
        name: 'Cake', 
        iconPath: 'assets/icons/pancake.svg', 
        boxColor: const Color(0xffC58BF2))
    );

    categories.add(
      CategoryModal(
        name: 'Pie', 
        iconPath: 'assets/icons/pie.svg', 
        boxColor: const Color(0xff92A3FD))
    );
    categories.add(
      CategoryModal(
        name: 'Smoothies', 
        iconPath: 'assets/icons/orange-snacks.svg', 
        boxColor: const Color(0xff92A3FD))
    );


    return categories;
  }

}