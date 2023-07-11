import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mini_sosmed/model/users.dart';

final link = "http://127.0.0.1:8000/api";

class UserContoller {
  Future<List<Users>> searchUser(String query) async {
    var url = Uri.parse("${link}/search?search=${query}");
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "Bearer 5|cozezdjIgxLsIRjjBkPw63gEupv0nhHqKoeNpExi",
    });
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var userList = jsonData['data'] as List<dynamic>;
      var users = userList.map((json) => Users.fromJson(json)).toList();
      return users;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<dynamic> followUser(String username) async {
    final url = Uri.parse("${link}/follow/${username}");
    var response = await http.post(
      url,
      headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Bearer 5|cozezdjIgxLsIRjjBkPw63gEupv0nhHqKoeNpExi",
      },
    );
    return response;
  }
}
