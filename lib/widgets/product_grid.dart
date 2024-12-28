import 'package:flutter/material.dart';
import 'package:shopping_app_interface/utils/Helper.dart';

import '../utils/Constants.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  AppConstants.products[index],
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Product ${index + 1}'),
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      onPressed: () => Helper.showAddToCartSnackBar(context,"Product ${index + 1} Added to Cart"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
