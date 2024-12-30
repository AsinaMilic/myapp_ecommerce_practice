import 'package:flutter/material.dart';
import 'screens/cart_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_detail_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes {
    return {
      '/': (context) => const HomeScreen(),
      '/cart': (context) => const CartScreen(),
      // '/product': (context) => const ProductDetailScreen(),
    };
  }
}
