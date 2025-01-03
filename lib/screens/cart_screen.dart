import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/providers/cart_provider.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: Stack(
          alignment: Alignment.center,
          children: [
              Image.asset(
                'assets/images/Ellipse 1.png',
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  'assets/images/arrow_back_ios.png',
                  height: MediaQuery.of(context).size.height * 0.02,
                  width: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
        ),
        elevation: 0,
        actions: [
          CircleAvatar(
            radius: 20,
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile_pic.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 25),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 16.0), 
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItemWidget(cart.items.values.toList()[i]),
            ),
          ),
          Card(
            color: Colors.transparent,
            elevation: 0,
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                          'Total:',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF757575),
                            fontSize: 18
                          )
                      ),
                      Text(
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF888888),
                          fontSize: 18
                        )
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Shipping:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF757575),
                              fontSize: 18
                          )
                      ),
                      Text(
                          '\$0.0',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF888888),
                            fontSize: 18
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Divider(),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                          'Grand Total:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF757575),
                              fontSize: 18
                          )
                      ),
                      Text(
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement checkout??
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE96E6E),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Checkout',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}