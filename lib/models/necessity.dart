import 'package:autism/models/my_cateogory.dart';
import 'package:flutter/material.dart';

class Necessity {
  final String image, category;
  final Color color;
  final List<MyCategory> subcategories;

  Necessity({
    required this.image,
    required this.category,
    required this.color,
    required this.subcategories,
  });
}