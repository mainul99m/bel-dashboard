import 'package:bel_dashboard/constant/constant.dart';
import 'package:bel_dashboard/controllers/shark_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SharkDataScreen extends StatelessWidget {
  final SharkDataController controller = Get.put(SharkDataController());
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
            Container(
              color: secondaryColor,
              child: dataViewer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget dataViewer(){
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(()=>Text('Total Sharks: ${controller.count}')),

            Obx(()=>Visibility(
              visible: controller.count > 0,
              child: SizedBox(
                height: 400,
                child: SfDataGrid(
                  source: controller.employeeDataSource,
                  columns: <GridColumn>[
                    GridColumn(
                      columnName: 'id',
                      label: Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text('ID'),
                      )
                    ),
                    GridColumn(
                        columnName: 'name',
                        label: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Name jlasdfsa r'),
                        )
                    ),
                    GridColumn(
                        columnName: 'designation',
                        label: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Designation'),
                        )
                    ),
                    GridColumn(
                        columnName: 'salary',
                        label: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Salary'),
                        )
                    ),
                  ]
                ),
              ),)
            )
          ],
        )
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
