import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String imagePath;
  final List<String> sizes;
  final List<Color> colors;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.sizes,
    required this.colors,
    this.isFavorite = false,
  });
}