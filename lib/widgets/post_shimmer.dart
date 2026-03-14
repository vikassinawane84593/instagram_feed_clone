import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PostShimmer extends StatelessWidget {
  const PostShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// profile row shimmer
          ListTile(
            leading: const CircleAvatar(radius: 20),
            title: Container(
              height: 10,
              color: Colors.white,
            ),
          ),

          /// image shimmer
          Container(
            height: 300,
            color: Colors.white,
          ),

          const SizedBox(height: 10),

          /// caption shimmer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 10,
              width: 200,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}