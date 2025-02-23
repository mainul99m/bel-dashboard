import 'package:get/get.dart';
import '../constant/shared_prefs_constants.dart';
import '../main.dart';
import '../screens/authentication_screen.dart';

class MainScreenController extends GetxController {
  var selectedSideMenuIndex = 1.obs;

  void logOut(){
    prefs.remove(SharedPrefsConstants.TOKEN);
    Get.offAll(()=>AuthenticationScreen());
  }

}