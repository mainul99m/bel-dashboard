import 'package:bel_dashboard/controllers/ray_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../constant/constant.dart';

class RayDataScreen extends StatelessWidget {
  final RayDataController controller = Get.put(RayDataController());
  final _headerTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10
  );
  RayDataScreen({super.key});

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
                child: pageHeading("Ray Data"),
              ),
            ),
            Expanded(
              child: Container(
                color: secondaryColor,
                child: dataViewer(),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget dataViewer(){
    return Container(
        child: Expanded(
          child: Column(
            children: [
              Obx(()=>Text('Total Rays: ${controller.count}')),
              Obx(()=>Visibility(
                visible: controller.count > 0,
                child: Expanded(
                  child: SfDataGridTheme(
                    data: SfDataGridThemeData(headerColor: const Color(0xff009889)),
                    child: SfDataGrid(
                      key: controller.rayDataKey,
                      source: controller.rayDataSource,
                      columnWidthMode: ColumnWidthMode.auto,
                      headerGridLinesVisibility: GridLinesVisibility.both,
                      columns: <GridColumn>[
                        GridColumn(
                            columnName: 'species',
                            label: Container(
                              height: 200,
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Species',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'diskLength',
                            label: Container(
                              height: 200,
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Disk Length',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'diskWidth',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Disk Width',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'tailLength',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Tail Length',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'weight',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Weight',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'lifeStage',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Life Stage',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'gender',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Gender',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'clasperLength',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Clasper Length',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'clasperIsHard',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Clasper Is Hard',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'pregnant',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Pregnant',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'location',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Location',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'dorsal',
                            width: 130,
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Dorsal View',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'ventral',
                            width: 130,
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Ventral View',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'lateral',
                            width: 130,
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Lateral View',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'gear',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Gear Caught With',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'boat',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Boat Type',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'catchLocation',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Catch Location',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'boughtBy',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Bought By',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'purpose',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Purpose',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'priceKG',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Price/KG',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'total',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Total of this',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                        GridColumn(
                            columnName: 'collectedAt',
                            label: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Data Collected at',
                                style: _headerTextStyle,
                              ),
                            )
                        ),
                      ],
                      stackedHeaderRows: <StackedHeaderRow>[
                        StackedHeaderRow(cells: <StackedHeaderCell>[
                          StackedHeaderCell(
                              columnNames: [
                                'dorsal', 'ventral', 'lateral'
                              ],
                              child: const Center(
                                child: Text(
                                  'Images',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                          ),
                          StackedHeaderCell(
                              columnNames: [
                                'gear','boat','catchLocation','boughtBy','purpose','priceKG','total','collectedAt'
                              ],
                              child: const Center(
                                child: Text(
                                  'Additional Information',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              )
                          )
                        ])
                      ],
                    ),
                  ),
                ),)
              )
            ],
          ),
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
              Obx(()=>Visibility(
                visible: !controller.loading.value,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: InkWell(
                    onTap: controller.getAllData,
                    child: Row(
                      children: [
                        Text(
                          'Load all Data',
                          style: TextStyle(
                            color: cardBackgroundColor,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 8,),
                        Icon(
                          Icons.refresh,
                          color: cardBackgroundColor,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
              InkWell(
                onTap: controller.exportRaystoCsv,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Download Data',
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
