import 'package:http/http.dart' as http;
import 'package:simou/models/login.dart';
import 'package:simou/models/session.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  static Future<Session> login(
      {required String username, required String password}) async {
    final response =
        await http.post(Uri.parse("${dotenv.env['BASE_API']}/login"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: loginToJson(Login(username: username, password: password)));

    if (response.statusCode == 200) {
      return sessionFromJson(response.body); //Session Modal
    } else {
      throw Exception('Failed to login.');
    }
  }
}
