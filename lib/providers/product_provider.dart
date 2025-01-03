//Manage product list, toggle favorite status.
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Jacket Jeans',
      price: 45.9,
      imageUrl: 'https://picsum.photos/seed/1/300/300',
      sizes: ['S', 'M', 'L', 'XL'],
      colors: [Colors.red, Colors.green, Colors.blue, Colors.white, Colors.black, Colors.purple],
    ),
    Product(
      id: '2',
      name: 'Acrylic Sweater',
      price: 37.9,
      imageUrl: 'https://picsum.photos/seed/2/300/300',
      sizes: ['M', 'L', 'XL'],
      colors: [Colors.black, Colors.blue, Colors.purple, Colors.white, Colors.red, Colors.green, Colors.yellow]
    ),
    Product(
      id: '3',
      name: 'Leather Jacket',
      price: 59.9,
      imageUrl: 'https://picsum.photos/seed/3/300/300',
      sizes: ['S', 'L', 'XL'],
      colors: [Colors.brown, Colors.black, Colors.red, Colors.green],
    ),
    Product(
      id: '4',
      name: 'Winter Coat',
      price: 65.9,
      imageUrl: 'https://picsum.photos/seed/4/300/300',
      sizes: ['S', 'M', 'L'],
      colors: [Colors.white, Colors.blue, Colors.green, Colors.red, Colors.black, Colors.purple, Colors.yellow, Colors.pink, Colors.grey, Colors.orange]
    ),
    Product(
      id: '5',
      name: 'Denim Jacket',
      price: 49.9,
      imageUrl: 'https://picsum.photos/seed/5/300/300',
      sizes: ['S', 'M', 'L', 'XL'],
      colors: [Colors.blue, Colors.black, Colors.red, Colors.white, Colors.brown]
    ),
    Product(
      id: '6',
      name: 'Cotton Jacket',
      price: 54.9,
      imageUrl: 'https://picsum.photos/seed/6/300/300',
      sizes: ['S', 'M', 'L', 'XL'],
      colors: [Colors.black, Colors.red, Colors.green, Colors.white]
    ),
  ];

  List<Product> get products => [..._products];

  void toggleFavorite(String id) {
    final product = _products.firstWhere((prod) => prod.id == id);
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }
}