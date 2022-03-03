import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simou/routes/route_name.dart';
import 'package:simou/services/dio_client.dart';

class DashboardBody extends StatelessWidget {
  DashboardBody({Key? key}) : super(key: key);
  final DioClient _dioClient = DioClient();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Dashboard"),
        ElevatedButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            var accessToken = prefs.getString('accessToken');
            await _dioClient.logout(token: accessToken!);
            await prefs.remove("accessToken");
            Get.toNamed(RouteName.welcome);
          },
          child: const Text("Logout"),
        )
      ],
    );
  }
}
