import 'package:bel_dashboard/constant/shared_prefs_constants.dart';
import 'package:bel_dashboard/screens/authentication_screen.dart';
import 'package:bel_dashboard/screens/main_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    initilizeApp();
  }

  initilizeApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(SharedPrefsConstants.TOKEN);

    await Future.delayed(Duration(seconds: 1));
    if(token != null) {
      Get.offAll(()=>MainScreen());
    } else {
      Get.offAll(()=>AuthenticationScreen());
    }
  }

}