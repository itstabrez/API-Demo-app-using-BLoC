import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_api_using_bloc_1/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostApi {
  Future<List<PostModel>> fetchingPost() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map(
          (e) {
            return PostModel(
              id: e['id'],
              email: e['email'] as String,
              body: e['body'] as String,
            );
          },
        ).toList();
      }
    } on SocketException {
      throw Exception('error fetching data');
    } on TimeoutException {
      throw Exception('error fetching data');
    }
    throw Exception('error fetching data');
  }
}
