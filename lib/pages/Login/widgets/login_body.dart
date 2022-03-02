import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simou/components/rounded_button.dart';
import 'package:simou/controllers/login_controller.dart';
import 'package:simou/pages/Login/widgets/background.dart';
import 'package:simou/pages/Login/widgets/rounded_input_field.dart';
import 'package:simou/pages/Login/widgets/rounded_password_field.dart';
import 'package:simou/services/api.dart';
import 'package:simou/services/api_exceptions.dart';

class LoginBody extends StatelessWidget {
  LoginBody({Key? key}) : super(key: key);
  final loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                errorText: loginController.username.error,
                onChanged: loginController.validateUsername,
              ),
              RoundedPasswordField(
                onChanged: loginController.validatePassword,
              ),
              RoundedButton(
                text: "LOGIN",
                press: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  var response = await API
                      .login(
                          username: loginController.username.value!,
                          password: loginController.password.value!)
                      .catchError((error) {
                    if (error is BadRequestException) {
                      var apiError = json.decode(error.message!);
                      log(apiError);
                    } else if (error is FetchDataException) {
                      log("FetchDataException");
                    } else {
                      var apiError = json.decode(error.message!);
                      log(apiError);
                    }
                  });
                  log(response.data.accessToken);
                  prefs.setString("accessToken", response.data.accessToken);

                  // if (loginController.validate) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       content: Text("Processing Data"),
                  //     ),
                  //   );
                  // }
                },
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
