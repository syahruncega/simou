import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simou/pages/Welcome/welcome_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:simou/routes/app_page.dart';
import 'package:simou/routes/route_name.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
      getPages: AppPage.pages,
      initialRoute: RouteName.welcome,
    );
  }
}
