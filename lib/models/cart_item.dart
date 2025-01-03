import 'dart:ui';

class CartItem {
  final String id;
  final String productId;
  final String name;
  final double price;
  final int quantity;
  final Color color;
  final String size;
  final String imagePath;

  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.color,
    required this.size,
    required this.imagePath,
  });
}
