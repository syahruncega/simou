import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simou/utils/validation_modal.dart';

class LoginController extends GetxController {
  // final storeName = 'Thick Shake'.obs;
  final usernameFieldController = TextEditingController();
  final emailFieldController = TextEditingController();
  ValidationModel username = ValidationModel(null, null);
  ValidationModel password = ValidationModel(null, null);

  void validateUsername(String? val) {
    if (val == null || val.isEmpty) {
      username = ValidationModel(null, 'Please enter username');
    } else {
      username = ValidationModel(val, null);
    }
  }

  void validatePassword(String? val) {
    if (val == null || val.isEmpty) {
      password = ValidationModel(
        null,
        'Please enter password',
      );
    } else {
      password = ValidationModel(val, null);
    }
  }

  bool get validate {
    return username.value != null && password.value != null;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
