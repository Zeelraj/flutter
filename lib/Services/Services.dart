// ignore_for_file: file_names

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
        return posts;
      } else {
        return <PostModel>[];
      }
    } catch (e) {
      return <PostModel>[];
    }
  }
}
