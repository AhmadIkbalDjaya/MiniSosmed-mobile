import 'dart:convert';
import 'dart:io';
import 'package:mini_sosmed/model/posts.dart';
import 'package:http/http.dart' as http;

final link = "http://127.0.0.1:8000/api/dashboard";

class PostContoller {
  Future<List<Posts>> get() async {
    var url = Uri.parse(link);
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "Bearer 5|cozezdjIgxLsIRjjBkPw63gEupv0nhHqKoeNpExi",
    });
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var postList = jsonData['data'] as List<dynamic>;
      var posts = postList.map((json) => Posts.fromJson(json)).toList();
      return posts;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
