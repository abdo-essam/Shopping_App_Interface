import 'package:flutter/material.dart';

import '../../lang/app_localizations.dart';
import '../../utils/style_constants.dart';


class SignUpButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignUpButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: StyleConstants.elevatedButtonStyle,
      child: Text(
        localizations.signUp,
        style: StyleConstants.buttonTextStyle,
      ),
    );
  }
}