// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:first_app/Home/HomePage.dart';
import 'package:first_app/Services/Services.dart';
import 'package:flutter/material.dart';
import '../data/constants.dart' as constants;

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  bool _isPublishingPost = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  onPublish(title, body) async {
    if (_isPublishingPost) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: const Text('Publishing...'),
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
                label: 'Okay',
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                })),
      );
    }

    if (title?.isEmpty || body?.isEmpty) {
      log('Title or Body is Missing..!!');
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: const Text('Title or Body is Missing..!!'),
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
                label: 'Okay',
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                })),
      );
    }

    setState(() {
      _isPublishingPost = true;
    });

    int postId = DateTime.now().microsecondsSinceEpoch;

    String payload = jsonEncode({
      'userId': 1,
      'title': title,
      'body': body,
      'id': postId,
    });

    await Services.createPost(payload).then((post) {
      setState(() {
        _isPublishingPost = false;
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));

      titleController.text = '';
      bodyController.text = '';
    }).catchError((e) {
      setState(() {
        _isPublishingPost = false;
      });
      log('AddPost: Something went wrong..., $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(constants.APP_NAME),
        backgroundColor: const Color.fromARGB(134, 180, 42, 18),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
        child: Column(
          children: [
            // Page Title
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 40),
              child: Text(
                constants.ADDPOSTPAGE_TITLE.toUpperCase(),
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            // TextField: Title
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Title'),
                )),
            // TextField: Body
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  maxLines: 8,
                  controller: bodyController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Body'),
                )),
            // ElevatedButton: Publish Post and Display Progress
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 20),
                child: _isPublishingPost
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () => onPublish(
                            titleController.text, bodyController.text),
                        child: Text(
                          constants.PUBLISH_POST.toUpperCase(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
