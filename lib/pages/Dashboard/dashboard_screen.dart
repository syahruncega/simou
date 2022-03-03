import 'package:flutter/material.dart';
import 'package:simou/pages/Dashboard/components/dashboard_body.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashboardBody(),
    );
  }
}
