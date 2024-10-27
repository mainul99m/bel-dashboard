import 'package:bel_dashboard/constant/constant.dart';
import 'package:bel_dashboard/controllers/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data/side_menu_data.dart';
import 'package:get/get.dart';

class SideMenuWidget extends StatelessWidget {
  MainScreenController controller = Get.find<MainScreenController>();
  SideMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) => buildMenuEntry(data, index),
      ),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {
    return Obx(()=>InkWell(
      onTap: () {
        controller.selectedSideMenuIndex.value = index;
      },
      child: Container(
        decoration: BoxDecoration(
          color: index == controller.selectedSideMenuIndex.value ? selectionColor : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: SvgPicture.asset(
                data.menu[index].icon,
                color: index == controller.selectedSideMenuIndex.value ? Colors.black :  Colors.grey,
                height: 20,
                width: 20,
              )
            ),
            Text(
              data.menu[index].title,
              style: TextStyle(
                color: index == controller.selectedSideMenuIndex.value ? Colors.black :  Colors.grey,
                fontSize: 16,
                fontWeight: index == controller.selectedSideMenuIndex.value ? FontWeight.bold : FontWeight.normal,
              )
            ),
          ],
        ),
      ),
    )
    );
  }
}
