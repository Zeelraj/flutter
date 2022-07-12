// ignore_for_file: file_names

import 'package:first_app/Post/Post.dart';
import 'package:first_app/Models/PostModel.dart';
import 'package:first_app/Services/Services.dart';
import 'package:flutter/material.dart';

class PostsList extends StatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  List<PostModel> _posts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    // Fetch the Posts
    Services.getPosts().then((posts) {
      setState(() {
        _posts = posts;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: _isLoading
          // Loading List
          ? ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16))),
                );
              })
          // Actual List
          : ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                PostModel? post = _posts[index];
                return ListTile(
                  title: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Post(post: post)));
                    },
                    child: Text('${post.id}: ${post.title}'),
                  ),
                );
              }),
    ));
  }
}
