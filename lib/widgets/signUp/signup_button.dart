import 'package:flutter/material.dart';

import '../../utils/style_constants.dart';


class SignUpButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignUpButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: StyleConstants.elevatedButtonStyle,
      child: Text(
        'Sign Up',
        style: StyleConstants.buttonTextStyle,
      ),
    );
  }
}