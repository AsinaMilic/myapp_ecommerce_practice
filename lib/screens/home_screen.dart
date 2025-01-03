import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myapp/providers/product_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/product_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 0.0, bottom: 8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/Ellipse 1.svg',
                height: MediaQuery.of(context).size.height * 0.04, 
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: SvgPicture.asset(
                  'assets/images/Vector_grid.svg',
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 0.0, bottom: 0.0),
            child: IconButton(
              iconSize: MediaQuery.of(context).size.height * 0.08, 
              icon: Image.asset(
                'assets/images/Ellipse 2.png',
                height: MediaQuery.of(context).size.height * 0.08, 
                width: MediaQuery.of(context).size.height * 0.08,  
              ),
              onPressed: () {
                // Implement profile functionality?
              },
            ),
          )
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 35.0, left: 35.0),
            child: const Text('Match Your Style', style: TextStyle(fontSize: 30)),
          ),

          const SizedBox(height: 20),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey[400]), 
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE96E6E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Trending Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDFDCDC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'All',
                      style: TextStyle(
                        color: Color(0xFF938F8F),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDFDCDC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'New',
                      style: TextStyle(
                        color: Color(0xFF938F8F),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(11.0),
              child: const ProductGrid(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 2) { 
            Navigator.pushNamed(context, '/cart');
          }
        },
      ),
    );
  }
}