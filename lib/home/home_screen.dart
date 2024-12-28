import 'package:flutter/material.dart';
import '../widgets/product_page_view.dart';
import '../widgets/product_grid.dart';
import '../widgets/hot_offers_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Shopping App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Our Products',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.3,
                child: const ProductPageView(),
              ),
              const SizedBox(height: 20),
              const ProductGrid(),
              const SizedBox(height: 20),
              const Text(
                'Hot Offers',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const HotOffersList(),
            ],
          ),
        ),
      ),
    );
  }
}