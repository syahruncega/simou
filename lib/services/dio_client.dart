import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:simou/models/auth.dart';
import 'package:simou/models/session.dart';
import 'package:simou/services/logging.dart';

class DioClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL']!))
    ..interceptors.add(Logging());

  Future<Session?> login({required Auth loginInfo}) async {
    Session? session;

    try {
      Response response = await _dio.post(
        "/login",
        data: loginInfo.toJson(),
        options: Options(responseType: ResponseType.plain),
      );

      log('${response.data}');
      session = sessionFromJson(response.data); //Error here
    } catch (e) {
      log('Error creating user: $e');
    }
    return session;
  }

  Future logout({required String token}) async {
    try {
      Response response = await _dio.get(
        "/logout",
        options: Options(responseType: ResponseType.plain, headers: {
          "authorization": "Bearer $token",
        }),
      );

      log('${response.data}');
    } catch (e) {
      log('Error creating user: $e');
    }
  }
}
