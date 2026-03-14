import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/post_provider.dart';
import '../widgets/post_card.dart';
import '../widgets/post_shimmer.dart';
import '../widgets/story_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {

      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 300) {

        context.read<PostProvider>().fetchPosts();
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<PostProvider>();

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Instagram",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(width: 16),
          Icon(Icons.send),
          SizedBox(width: 12),
        ],
      ),

      body: Column(
        children: [

          /// STORIES ROW
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {

                return const StoryItem(
                  imageUrl:
                  "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
                  username: "user",
                );

              },
            ),
          ),

          const Divider(),

          /// POST FEED
          Expanded(
            child: ListView.builder(

              controller: _scrollController,

              itemCount: provider.posts.length +
                  (provider.isLoading ? 1 : 0),

              itemBuilder: (context, index) {

                if (index < provider.posts.length) {

                  final post = provider.posts[index];

                  return PostCard(post: post);

                } else {

                  return const PostShimmer();

                }

              },
            ),
          ),
        ],
      ),
    );
  }
}