//Manage cart items, total amount.
import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};
  double get totalAmount => _items.values.fold(0.0, (sum, item) => sum + item.price * item.quantity);

  void addItem(String productId, String name, double price, String selectedSize, Color selectedColor  ) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingItem) => CartItem(
          id: existingItem.id,
          productId: existingItem.productId,
          name: existingItem.name,
          price: existingItem.price,
          quantity: existingItem.quantity + 1,
          color: existingItem.color,
          size: existingItem.size,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          productId: productId,
          name: name,
          price: price,
          quantity: 1,
          color: selectedColor,
          size: selectedSize,
        ),
      );
    }
    notifyListeners();
  }
}
