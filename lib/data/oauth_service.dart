import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class OauthService {
  static const String uid =
      "6114ffe6e86f68d7df4493793b077457c521a4b57bc93351a71f3daa7a286e2a";
  static const secret =
      "503cc6a71a323a44b73022e82b74be0840dcba0e2cf0b7380ace2761df6a26c1";
  static const baseUrl42 = "https://api.intra.42.fr";
  String token = "";

  Future<String> getToken() async {
    if (await checkToken(token) == false) {
      try {
        final response = await http.post(Uri.parse("$baseUrl42/oauth/token"),
            body: {
              "grant_type": "client_credentials",
              "client_id": uid,
              "client_secret": secret
            });
        if (response.statusCode == 200) {
          final jsonResponse = jsonDecode(response.body);
          token = jsonResponse["access_token"] as String;
        } else {
          getToken();
        }
      } catch (e) {
        getToken();
      }
    }
    return token;
  }

  Future<bool> checkToken(String token) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl42/oauth/token/info"),
          headers: {"Authorization": "Bearer $token"});
      print(json.decode(response.body));
      if (response.statusCode == 200) return true;
      return false;
    } catch (e) {
      print("errorcheck : $e");
    }
    return false;
  }

  Future<dynamic> fetchUser(String username) async {
    await getToken();
    try {
      final response = await http.get(
          Uri.parse("$baseUrl42/v2/users/$username"),
          headers: {"Authorization": "Bearer ${token}"});
      if (response.statusCode == 200) return json.decode(response.body);
    } catch (e) {
      print(e);
    }
    return null;
  }
}
