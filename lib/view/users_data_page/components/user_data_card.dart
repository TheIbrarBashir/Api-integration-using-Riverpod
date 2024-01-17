import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../repository/models/users_data.dart';

class ProfileCard extends StatelessWidget {
  final User? user;

  const ProfileCard({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[850],
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CircleAvatar(
                radius: 30,
                child: CachedNetworkImage(
                  imageUrl: user?.pictureThumb ?? '',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${user?.firstName ?? ''} ${user?.lastName ?? ''}',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Divider(color: Colors.grey[600]),
            InfoTile(icon: Icons.person, text: user?.gender ?? ''),
            InfoTile(icon: Icons.cake, text: '${user?.dateOfBirth ?? ''}'),
            InfoTile(icon: Icons.fitness_center, text: user?.weight ?? ''),
            InfoTile(
                icon: Icons.account_balance, text: '${user?.isBoxer ?? ''}'),
            //  InfoTile(icon: Icons.location_on, text: 'Denver, CO'),
            // InfoTile(icon: Icons.person, text: 'Steven Trujillo'),
            //InfoTile(icon: Icons.confirmation_number, text: '853993'),
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoTile({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
