import 'package:bel_dashboard/constant/constant.dart';
import 'package:bel_dashboard/controllers/shark_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SharkDataScreen extends StatelessWidget {
  SharkDataController controller = Get.put(SharkDataController());
  SharkDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 44,
              child: Container(
                color: secondaryColor,
                child: pageHeading("Shark Data"),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                color: secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pageHeading(String title){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: cardBackgroundColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: (){},
                child: Row(
                  children: [
                    Text(
                      'Download All Data',
                      style: TextStyle(
                        color: cardBackgroundColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8,),
                    Icon(
                      Icons.download,
                      color: cardBackgroundColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 4,),
        Container(
          height: 1,
          color: primaryColor,
        ),
      ],
    );
  }
}
