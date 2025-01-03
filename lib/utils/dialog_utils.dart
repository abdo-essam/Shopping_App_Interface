import 'package:flutter/material.dart';

import '../lang/app_localizations.dart';

class DialogUtils {
  static void showSuccessDialog({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onClose,
  }) {
    final localizations = AppLocalizations.of(context);
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
            child: Text(localizations.close),
          ),
        ],
      ),
    );
  }
}