
import 'package:flutter/material.dart';

class Helper {
  static void showAddToCartSnackBar(BuildContext context , String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

}