import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      /*appBar: AppBar(title: const Text('My Cart')),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (ctx, i) => CartItemWidget(cart.items.values.toList()[i]),
      ),
      bottomNavigationBar: CheckoutBar(total: cart.totalAmount),*/
    );
  }
}
