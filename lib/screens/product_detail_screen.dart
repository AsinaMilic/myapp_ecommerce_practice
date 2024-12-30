import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart'; // Adjust the import path as necessary

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name)
      ),
      body: ListView(
        children: [
          FadeInImage(
            placeholder: const AssetImage('assets/images/placeholder.png'),
            image: NetworkImage(product.imageUrl),
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, color: Colors.blue),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Description:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                /*Text(
                  product.description ?? 'No description available.',
                  style: const TextStyle(fontSize: 16),
                ),*/
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add to cart logic
              },
              child: const Text('Add to Cart'),
            ),
            ElevatedButton(
              onPressed: () {
                // Buy now logic
              },
              child: const Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}