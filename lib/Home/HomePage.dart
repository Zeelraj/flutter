// ignore_for_file: file_names

import 'dart:developer';

import 'package:first_app/Post/AddPost.dart';
import 'package:first_app/Post/PostsList.dart';
import 'package:flutter/material.dart';
import 'package:first_app/data/constants.dart' as constants;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Title Bar
      appBar: AppBar(
        title: const Text(constants.APP_NAME),
        backgroundColor: const Color.fromARGB(134, 180, 42, 18),
      ),
      // App body
      body: const PostsList(),
      // Floating Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPost()));
        },
        backgroundColor: const Color.fromARGB(255, 180, 42, 18),
        tooltip: 'Add Post',
        child: const Icon(Icons.add),
      ),
    );
  }
}
