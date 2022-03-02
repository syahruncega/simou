import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simou/controllers/login_controller.dart';
import 'package:simou/pages/Login/widgets/login_body.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
    );
  }
}
