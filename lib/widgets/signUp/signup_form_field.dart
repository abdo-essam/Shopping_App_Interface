import 'package:flutter/material.dart';
import '../../utils/style_constants.dart';

class SignUpFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData prefixIcon;
  final bool isPassword;
  final bool isVisible;
  final VoidCallback? onVisibilityToggle;
  final String? Function(String?) validator;

  const SignUpFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.prefixIcon,
    this.isPassword = false,
    this.isVisible = false,
    this.onVisibilityToggle,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: StyleConstants.buildInputDecoration(
        label: label,
        prefixIcon: prefixIcon,
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            isVisible ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: onVisibilityToggle,
        )
            : null,
      ),
      obscureText: isPassword && !isVisible,
      validator: validator,
    );
  }
}