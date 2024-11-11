import 'package:bel_dashboard/constant/shared_prefs_constants.dart';
import 'package:bel_dashboard/main.dart';
import 'package:bel_dashboard/models/login_response_model.dart';
import 'package:bel_dashboard/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/main_screen.dart';


class AuthenticatorController extends GetxController {

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() async{
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
    final phoneNumber = phoneNumberController.text;
    final password = passwordController.text;
    LoginResponseModel? response = await RemoteService.login(phoneNumber, password);
    if(response != null) {
      Get.snackbar(
        'Success',
        'Login Successful',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      prefs.setString(SharedPrefsConstants.TOKEN, response.token!);

      Get.offAll(() => MainScreen());
    } else {
      Get.snackbar(
        'Error',
        'Login Failed',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}