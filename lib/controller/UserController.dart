import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mini_sosmed/model/users.dart';

class UserContoller {
  Future<List<Users>> searchUser(String query) async {
    final link = "http://127.0.0.1:8000/api/search?search=${query}";
    var url = Uri.parse(link);
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
}
