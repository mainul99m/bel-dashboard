import 'package:bel_dashboard/controllers/main_screen_controller.dart';
import 'package:bel_dashboard/screens/shark_data_screen.dart';
import 'package:bel_dashboard/widgets/side_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreenController controller = Get.put(MainScreenController());
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: SideMenuWidget(),
                ),
              ),
              Expanded(
                flex: 9,
                child: Obx(()=>loadScreen(controller.selectedSideMenuIndex.value))
              ),
            ],
          )
      )
    );
  }

  Widget loadScreen(int index){
    switch(index){
      case 0:
        return Container(
          color: Colors.red,
        );
      case 1:
        return SharkDataScreen();
      case 2:
        return Container(
          color: Colors.yellow,
        );
    }
    return Container(
      color: Colors.blue,
    );
  }
}
