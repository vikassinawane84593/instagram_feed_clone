import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';
import '../widgets/post_card.dart';

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

      body: ListView.builder(

        controller: _scrollController,

        itemCount: provider.posts.length +

            (provider.isLoading ? 1 : 0),

        itemBuilder: (context, index) {

          if (index < provider.posts.length) {

            final post = provider.posts[index];

            return PostCard(post: post);

          } else {

            return const Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

        },
      ),
    );
  }
}