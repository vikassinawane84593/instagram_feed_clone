import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/post_model.dart';
import '../providers/post_provider.dart';


class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {

    final provider = context.read<PostProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        ListTile(
          leading: CircleAvatar(
            backgroundImage:
            CachedNetworkImageProvider(widget.post.userImage),
          ),
          title: Text(widget.post.username),
          trailing: const Icon(Icons.more_vert),
        ),


        SizedBox(
          height: 300,
          child: PageView.builder(
            itemCount: widget.post.postImages.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: CachedNetworkImage(
                  imageUrl: widget.post.postImages[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.post.postImages.length,
                (index) => Container(
              margin: const EdgeInsets.all(4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPage == index
                    ? Colors.blue
                    : Colors.grey,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [

              IconButton(
                icon: Icon(
                  widget.post.isLiked
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: widget.post.isLiked
                      ? Colors.red
                      : null,
                ),
                onPressed: () {
                  provider.toggleLike(widget.post);
                },
              ),

              IconButton(
                icon: const Icon(Icons.chat_bubble_outline),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Comments not implemented"),
                    ),
                  );
                },
              ),

              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Share not implemented"),
                    ),
                  );
                },
              ),

              const Spacer(),

              IconButton(
                icon: Icon(
                  widget.post.isSaved
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                ),
                onPressed: () {
                  provider.toggleSave(widget.post);
                },
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "${widget.post.likes} likes",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "${widget.post.username} ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: widget.post.caption),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}