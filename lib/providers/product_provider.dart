//Manage product list, toggle favorite status.
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = []; // Initial product data

  List<Product> get products => [..._products];

  void toggleFavorite(String id) {
    final product = _products.firstWhere((prod) => prod.id == id);
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }
}
