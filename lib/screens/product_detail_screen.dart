import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/models/product.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String? selectedSize;
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/Ellipse 1.svg',
                height: 40,
                width: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: SvgPicture.asset(
                  'assets/images/Vector_grid.svg',
                  height: 23,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              iconSize: 44,
              icon: Image.asset(
                'assets/images/Ellipse 2.png',
                height: 44,
                width: 44,
              ),
              onPressed: () {
                // Implement profile functionality
              },
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          FadeInImage(
            placeholder: const AssetImage('assets/images/placeholder.png'),
            image: NetworkImage(widget.product.imageUrl),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    widget.product.name,
                    style: const TextStyle(fontSize: 24, color: Color(0xFF444444)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    '\$${widget.product.price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 24, color: Color(0xFF4D4C4C)),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 32.0, top: 10.0, bottom: 16.0),
            child: Text(
              'Size',
              style: TextStyle(fontSize: 24, color: Color(0xFF444444)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26.0),
            child: Row(
              children: [
                for (final size in widget.product.sizes)
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: ChoiceChip(
                      label: Text(
                        size,
                        style: TextStyle(
                          fontSize: 16,
                          color: selectedSize == size ? const Color(0xFFE55B5B) : const Color(0xFF444444),
                        ),
                      ),
                      selected: false,
                      backgroundColor: Colors.white,
                      selectedColor: const Color(0xFF444444),
                      shape: const CircleBorder(),
                      side: BorderSide.none, // Remove the border
                      onSelected: (bool selected) {
                        print('Selected: $size, isSelected: $selected'); // Debug print
                        setState(() {
                          selectedSize = selected ? size : null;
                        });
                        print('Current selectedSize: $selectedSize'); // Debug print
                      },
                    ),
                  )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 32.0, top: 16.0, bottom: 16.0),
            child: Text(
              'Colors',
              style: TextStyle(fontSize: 24, color: Color(0xFF444444)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26.0),
            child: Row(
              children: [
                for (final color in widget.product.colors)
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = selectedColor == color ? null : color;
                          print('Selected color: $color'); // Debug print
                          print('Current selectedColor: $selectedColor'); // Debug print
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedColor == color ? color : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0), 
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: color, 
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: const Color(0xFFE96E6E),
              ),
              onPressed: () {
                // Validate size and color selection
                if (selectedSize == null || selectedColor == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select both size and color before adding to cart'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                // If validation passes, add to cart
                context.read<CartProvider>().addItem(
                  widget.product.id,
                  widget.product.name,
                  widget.product.price,
                  selectedSize!,
                  selectedColor!,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${widget.product.name} added to cart!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}