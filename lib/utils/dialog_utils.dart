import 'package:flutter/material.dart';

class DialogUtils {
  static void showSuccessDialog({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onClose,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              onClose();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}