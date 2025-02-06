import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_auth/local_auth.dart';
import '../utils/biometric_utils.dart';
import '../widgets/profile/profile_header.dart';
import '../widgets/profile/profile_info_card.dart';
import '../lang/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.profile),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ProfileHeader(
                imageUrl: user?.photoURL,
                onImageTap: () {
                  // Handle profile image update
                },
              ),
              const SizedBox(height: 24),
              ProfileInfoCard(
                fullName: user?.displayName ?? '',
                email: user?.email ?? '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}