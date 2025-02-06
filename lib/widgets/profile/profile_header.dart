import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback onImageTap;

  const ProfileHeader({
    super.key,
    this.imageUrl,
    required this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onImageTap,
      child: CircleAvatar(
        radius: 60,
        backgroundImage: imageUrl != null
            ? NetworkImage(imageUrl!)
            : const AssetImage('assets/default_profile.png') as ImageProvider,
        child: imageUrl == null
            ? const Icon(Icons.person, size: 60, color: Colors.white70)
            : null,
      ),
    );
  }
}