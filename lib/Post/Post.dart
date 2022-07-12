// ignore_for_file: file_names

import 'package:first_app/Models/PostModel.dart';
import 'package:flutter/material.dart';
import '../data/constants.dart' as constants;

class Post extends StatefulWidget {
  final PostModel post;
  const Post({Key? key, required this.post}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(constants.APP_NAME),
          backgroundColor: const Color.fromARGB(134, 180, 42, 18),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              // Title
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.post.title,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
              // PostId and UserId
              Container(
                padding: const EdgeInsets.fromLTRB(0, 7, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Id: ${widget.post.id}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Posted By User Id: ${widget.post.userId}',
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              // Post Body
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Text(widget.post.body),
              ),
            ],
          ),
        ));
  }
}
