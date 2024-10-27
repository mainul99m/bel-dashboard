import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthenticatorController extends GetxController {

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() {
    if(phoneNumberController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all the fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    print('Email: ${phoneNumberController.text}');
    print('Password: ${passwordController.text}');
  }
}