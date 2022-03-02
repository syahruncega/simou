import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simou/components/rounded_button.dart';
import 'package:simou/pages/Login/login_screen.dart';
import 'package:simou/pages/Welcome/widgets/welcome_background.dart';
import 'package:simou/routes/route_name.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return WelcomeBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "WELCOME TO SIMOU",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                // Get.toNamed(RouteName.login);
                SharedPreferences prefs = await SharedPreferences.getInstance();
                var accessToken = prefs.getString('accessToken');
                if (accessToken != null) {
                  log(accessToken);
                } else {
                  Get.toNamed(RouteName.login);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
