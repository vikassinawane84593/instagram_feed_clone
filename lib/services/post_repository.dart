import 'dart:async';
import '../models/post_model.dart';

class PostRepository {

  Future<List<Post>> fetchPosts(int page) async {

    // simulate network delay
    await Future.delayed(const Duration(milliseconds: 1500));

    List<Post> posts = List.generate(10, (index) {

      return Post(
        username: "user_${page}_$index",

        userImage:
        "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",

        postImages: [
          "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d",
          "https://images.unsplash.com/photo-1492724441997-5dc865305da7",
          "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee"
        ],

        caption: "Beautiful moment from nature 🌿",

        likes: 120 + index,
      );

    });

    return posts;
  }
}