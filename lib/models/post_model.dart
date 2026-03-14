class Post {
  final String username;
  final String userImage;
  final List<String> postImages;
  final String caption;
  final int likes;

  bool isLiked;
  bool isSaved;

  Post({
    required this.username,
    required this.userImage,
    required this.postImages,
    required this.caption,
    required this.likes,
    this.isLiked = false,
    this.isSaved = false,
  });
}
