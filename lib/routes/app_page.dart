import 'package:get/get.dart';
import 'package:simou/bindings/login_binding.dart';
import 'package:simou/pages/Dashboard/dashboard_screen.dart';
import 'package:simou/pages/Login/login_screen.dart';
import 'package:simou/pages/Welcome/welcome_screen.dart';
import 'package:simou/routes/route_name.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RouteName.welcome,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteName.dashboard,
      page: () => const DashboardScreen(),
    ),
  ];
}
