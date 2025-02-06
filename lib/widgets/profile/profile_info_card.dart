import 'package:flutter/material.dart';

class ProfileInfoCard extends StatelessWidget {
  final String fullName;
  final String email;

  const ProfileInfoCard({
    super.key,
    required this.fullName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(fullName),
              subtitle: const Text('Full Name'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(email),
              subtitle: const Text('Email'),
            ),
          ],
        ),
      ),
    );
  }
}