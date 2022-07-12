// ignore_for_file: file_names

import 'dart:developer';

import 'package:http/http.dart';

import '../Models/PostModel.dart';
import '../data/constants.dart' as constants;

class Services {
  // Get Posts Service
  static Future<List<PostModel>> getPosts() async {
    try {
      final response = await get(Uri.parse(constants.FETCH_POSTS));
      if (response.statusCode == 200) {
        final List<PostModel> posts = postModelsFromJson(response.body);
        log('getPosts: List of Users Fetched.');
        return posts;
      } else {
        log('getPosts: List of Users Not Fetched.');
        return <PostModel>[];
      }
    } catch (e) {
      log('getPosts: Something went wrong..., $e');
      return <PostModel>[];
    }
  }

  // Create Post Service
  static Future<PostModel> createPost(String payload) async {
    try {
      final response = await post(Uri.parse(constants.CREATE_POST),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: payload);
      if (response.statusCode == 201) {
        final PostModel post = postModelFromJson(response.body);
        log('createPost: Post is Created.');
        return post;
      } else {
        log('createPost: Post is Not Created.');
        throw Exception('Failed to Create Post.');
      }
    } catch (e) {
      log('createPost: Something went wrong..., $e');
      throw Exception('Something went wrong..., $e');
    }
  }
}
