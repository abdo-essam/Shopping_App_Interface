import 'package:flutter/material.dart';
import '../../lang/app_localizations.dart';
import '../../utils/style_constants.dart';

class SignUpButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? text; // Optional text parameter
  final bool isOutlined; // For different button styles
  final double? width; // Optional width parameter
  final ButtonStyle? customStyle; // Optional custom style

  const SignUpButton({
    super.key,
    required this.onPressed,
    this.text,
    this.isOutlined = false,
    this.width,
    this.customStyle,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    // Default button style based on isOutlined
    final defaultStyle = isOutlined
        ? StyleConstants.outlinedButtonStyle
        : StyleConstants.elevatedButtonStyle;

    return SizedBox(
      width: width ?? double.infinity, // Full width by default
      child: isOutlined
          ? OutlinedButton(
        onPressed: onPressed,
        style: customStyle ?? defaultStyle,
        child: Text(
          text ?? localizations.signUp,
          style: isOutlined
              ? StyleConstants.outlinedButtonTextStyle
              : StyleConstants.buttonTextStyle,
        ),
      )
          : ElevatedButton(
        onPressed: onPressed,
        style: customStyle ?? defaultStyle,
        child: Text(
          text ?? localizations.signUp,
          style: StyleConstants.buttonTextStyle,
        ),
      ),
    );
  }
}