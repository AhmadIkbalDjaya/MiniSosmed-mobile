import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mini_sosmed/auth.dart';

final link = "https://sgso-invitation.com/api";

class LoginRegisController {
  Future<dynamic> regis(String name, String email, String password) async {
    var url = Uri.parse("${link}/register");
    var bodyRegis = {"name": name, "email": email, "password": password};
    var response = await http.post(url, body: bodyRegis, headers: {
      HttpHeaders.acceptHeader: "application/json",
    });
    // print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> login(String email, String password) async {
    var url = Uri.parse("${link}/login");
    var bodyLogin = {"email": email, "password": password};
    var response = await http.post(url, body: bodyLogin, headers: {
      HttpHeaders.acceptHeader: "application/json",
    });
    // print(response.body);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData['data'];
      print(data["user_id"]);
      Auth.setAuth(data["access_toke"], data["user_id"].toString(),
          data['name'], data['username'], data['profile_image']);
      print(data['name']);
      print(Auth.name);
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> logout() async {
    var url = Uri.parse("${link}/logout");
    var response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${Auth.accessToken}",
    });
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
