

import 'dart:convert';

import 'package:decode_session22_post_api/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  
  Future<PostModel> submitPost({ required String postTitle, required String postBody}) async {

    String url = 'https://jsonplaceholder.typicode.com/posts';
    Map<String, dynamic> body = {
      'title': postTitle,
      'body': postBody,
      'userId': 1,
    };

    http.Response response = await http.post(Uri.parse(url), body: body);

    if( response.statusCode == 200 || response.statusCode == 201 ) {

      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);

      PostModel postModel = PostModel.fromJson(jsonResponse);
      return postModel;

    }else{

      throw Exception('Something went wrong');
    }

  }

}