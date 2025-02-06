import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:local_auth_android/local_auth_android.dart';

class BiometricUtils {
  static final LocalAuthentication _localAuth = LocalAuthentication();

  static Future<bool> canAuthenticate() async {
    try {
      final bool canCheckBiometrics = await _localAuth.canCheckBiometrics;
      final bool isDeviceSupported = await _localAuth.isDeviceSupported();

      return canCheckBiometrics && isDeviceSupported;
    } on PlatformException catch (e) {
      debugPrint('Error checking biometric availability: ${e.message}');
      return false;
    }
  }

  static Future<bool> authenticate() async {
    try {
      final List<BiometricType> availableBiometrics =
      await _localAuth.getAvailableBiometrics();

      debugPrint('Available biometrics: $availableBiometrics');

      if (availableBiometrics.isEmpty) {
        return false;
      }

      return await _localAuth.authenticate(
        localizedReason: 'Please authenticate to view your profile',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Authentication required',
            cancelButton: 'Cancel',
            biometricHint: 'Verify your identity',
          ),
        ],
      );
    } on PlatformException catch (e) {
      debugPrint('Error during authentication: ${e.message}');
      return false;
    }
  }
}