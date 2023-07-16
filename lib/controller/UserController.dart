import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mini_sosmed/auth.dart';
import 'package:mini_sosmed/model/posts.dart';
import 'package:mini_sosmed/model/profile.dart';
import 'package:mini_sosmed/model/users.dart';

final link = "https://sgso-invitation.com/api";

class UserContoller {
  Future<List<Users>> searchUser(String query) async {
    var url = Uri.parse("${link}/search?search=${query}");
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${Auth.accessToken}",
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
        HttpHeaders.authorizationHeader: "Bearer ${Auth.accessToken}",
      },
    );
    print(response.body);
    return response;
  }

  Future<Profile> profileUser(String username) async {
    var url = Uri.parse("${link}/profile/${username}");
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${Auth.accessToken}",
    });
    // print(response.body);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData['data'];
      var profile = Profile.fromJson(data);
      return profile;
    } else {
      throw Exception("failed load Profile");
    }
  }

  Future<List<Posts>> postsUser(String username) async {
    var url = Uri.parse("${link}/profile/posts/${username}");
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${Auth.accessToken}",
    });
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var postList = jsonData['data'] as List<dynamic>;
      var posts = postList.map((e) => Posts.fromJson(e)).toList();
      return posts;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<dynamic> updateBio(
      String birthday, String gender, String address) async {
    var url = Uri.parse("${link}/profile/updateBio");
    var bodyUpdate = {
      "birthday": birthday,
      "genre": gender,
      "address": address
    };
    var response = await http.post(url, body: bodyUpdate, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${Auth.accessToken}",
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> userFollowers(String username) async {
    var url = Uri.parse("${link}/user/followers/${username}");
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${Auth.accessToken}",
    });
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var userList = jsonData['data'] as List<dynamic>;
      var users = userList.map((e) => Users.fromJson(e)).toList();
      return users;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  Future<dynamic> userFollowing(String username) async {
    var url = Uri.parse("${link}/user/following/${username}");
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${Auth.accessToken}",
    });
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var userList = jsonData['data'] as List<dynamic>;
      var users = userList.map((e) => Users.fromJson(e)).toList();
      return users;
    } else {
      throw Exception("Failed to fetch data");
    }
  }
}
