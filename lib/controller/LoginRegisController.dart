import 'dart:io';
import 'package:http/http.dart' as http;

final link = "http://127.0.0.1:8000/api";

class LoginRegisController {
  Future<dynamic> regis(String name, String email, String password) async {
    var url = Uri.parse("${link}/register");
    var bodyRegis = {"name": name, "email": email, "password": password};
    var response = await http.post(url, body: bodyRegis, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "Bearer 5|cozezdjIgxLsIRjjBkPw63gEupv0nhHqKoeNpExi",
    });
    print(response.body);
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
      HttpHeaders.authorizationHeader:
          "Bearer 5|cozezdjIgxLsIRjjBkPw63gEupv0nhHqKoeNpExi",
    });
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
