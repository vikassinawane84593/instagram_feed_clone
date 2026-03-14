import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../services/post_repository.dart';

class PostProvider with ChangeNotifier {

  final PostRepository _repository = PostRepository();

  List<Post> _posts = [];
  List<Post> get posts => _posts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _page = 1;

  // fetch posts
  Future<void> fetchPosts() async {

    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    final newPosts = await _repository.fetchPosts(_page);

    _posts.addAll(newPosts);

    _page++;

    _isLoading = false;
    notifyListeners();
  }

  // toggle like
  void toggleLike(Post post) {
    post.isLiked = !post.isLiked;
    notifyListeners();
  }

  // toggle save
  void toggleSave(Post post) {
    post.isSaved = !post.isSaved;
    notifyListeners();
  }
}