import 'package:flutter/material.dart';
import '../utils/biometric_utils.dart';
import '../screens/profile_screen.dart';
import '../lang/app_localizations.dart';
import '../utils/snackbar_utils.dart';

class ProfileIconButton extends StatelessWidget {
  const ProfileIconButton({super.key});

  Future<void> _handleProfileAccess(BuildContext context) async {
    final localizations = AppLocalizations.of(context);
    debugPrint('Starting profile access...');

    try {
      debugPrint('Checking biometric availability...');
      final canAuth = await BiometricUtils.canAuthenticate();
      debugPrint('Can authenticate: $canAuth');

      if (!canAuth) {
        if (context.mounted) {
          debugPrint('Biometric authentication not available');
          SnackBarUtils.showErrorSnackBar(
            context: context,
            message: localizations.biometricNotAvailable,
          );
        }
        return;
      }

      debugPrint('Starting authentication...');
      final authenticated = await BiometricUtils.authenticate();
      debugPrint('Authentication result: $authenticated');

      if (authenticated && context.mounted) {
        debugPrint('Authentication successful, navigating to profile...');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
      } else if (context.mounted) {
        debugPrint('Authentication failed');
        SnackBarUtils.showErrorSnackBar(
          context: context,
          message: localizations.authenticationFailed,
        );
      }
    } catch (e) {
      debugPrint('Error during profile access: $e');
      if (context.mounted) {
        SnackBarUtils.showErrorSnackBar(
          context: context,
          message: e.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.person),
      onPressed: () {
        debugPrint('Profile icon pressed');
        _handleProfileAccess(context);
      },
    );
  }
}