import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simou/components/rounded_button.dart';
import 'package:simou/screens/Login/widgets/background.dart';
import 'package:simou/screens/Login/widgets/rounded_input_field.dart';
import 'package:simou/screens/Login/widgets/rounded_password_field.dart';
import 'package:simou/services/api.dart';
import 'package:simou/services/api_exceptions.dart';
import 'dart:developer';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: SingleChildScrollView(
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
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                var response = await API
                    .login(username: "syahruncega", password: "syahruncega")
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
              },
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
