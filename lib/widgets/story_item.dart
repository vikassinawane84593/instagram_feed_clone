import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class StoryItem extends StatelessWidget {
  final String imageUrl;
  final String username;

  const StoryItem({
    super.key,
    required this.imageUrl,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [

          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.pink,
                width: 2,
              ),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage:
              CachedNetworkImageProvider(imageUrl),
            ),
          ),

          const SizedBox(height: 5),

          Text(
            username,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}