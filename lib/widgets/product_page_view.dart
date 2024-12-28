import 'package:flutter/material.dart';

import '../utils/Constants.dart';

class ProductPageView extends StatelessWidget {
  const ProductPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          child: Image.network(
            AppConstants.pageViewImages[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}