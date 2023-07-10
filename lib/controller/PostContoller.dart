import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'package:mini_sosmed/model/posts.dart';
import 'package:http/http.dart' as http;

final link = "http://127.0.0.1:8000/api";

class PostContoller {
  Future<List<Posts>> get() async {
    var url = Uri.parse("${link}/dashboard");
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

  Future<dynamic> post(String body) async {
    var url = Uri.parse("${link}/post");
    var bodyPost = {"body": body};
    var response = await http.post(url, body: bodyPost, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "Bearer 5|cozezdjIgxLsIRjjBkPw63gEupv0nhHqKoeNpExi",
    });
    if (response.statusCode == 200) {
      return true;
      // return response.body;
    } else {
      // return body;
      // return response.body;
      return false;
    }
  }
}
