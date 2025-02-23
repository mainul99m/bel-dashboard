import 'package:bel_dashboard/constant/constant.dart';
import 'package:bel_dashboard/controllers/shark_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class SharkDataScreen extends StatelessWidget {
  final SharkDataController controller = Get.put(SharkDataController());

  final _headerTextStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 10
  );
  SharkDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            child: Container(
              color: secondaryColor,
              child: dataViewer(),
            ),
          ),
        ],
      ),
    );
  }

  Widget dataViewer(){
    const padding16 = EdgeInsets.all(16.0);
    return Column(
      children: [
        Obx(()=>Text('Total Sharks: ${controller.count}')),

        Obx(()=>Visibility(
          visible: controller.count > 0,
          child: Expanded(
            child: SfDataGridTheme(
              data: const SfDataGridThemeData(headerColor: Color(0xff009889)),
              child: SfDataGrid(
                key: controller.sharkDataKey,
                source: controller.sharkDataSource,
                columnWidthMode: ColumnWidthMode.auto,
                headerGridLinesVisibility: GridLinesVisibility.both,
                columns: <GridColumn>[
                  GridColumn(
                    columnName: 'species',
                    label: Container(
                      height: 200,
                      padding: padding16,
                      child: Text(
                          'Species',
                        style: _headerTextStyle,
                      ),
                    )
                  ),
                  GridColumn(
                      columnName: 'totalLength',
                      label: Container(
                        height: 200,
                        padding: padding16,
                        child: Text(
                            'Total Length',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'forkLength',
                      label: Container(
                        height: 200,
                        padding: padding16,
                        child: Text(
                            'Fork Length',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'dorsalFinLength',
                      label: Container(
                        padding: padding16,
                        child: Text(
                          'Dorsal Fin Length',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'lifeStage',
                      label: Container(
                        padding: padding16,
                        child: Text(
                          'Life Stage',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'gender',
                      label: Container(
                        padding: padding16,
                        child: Text(
                          'Gender',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'clasperLength',
                      label: Container(
                        padding: padding16,
                        child: Text(
                          'Clasper Length',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'clasperIsHard',
                      label: Container(
                        padding: padding16,
                        child: Text(
                          'Clasper Is Hard',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'pregnant',
                      label: Container(
                        padding: padding16,
                        child: Text(
                          'Pregnant',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'numberOfPups',
                      label: Container(
                        padding: padding16,
                        child: Text(
                          'Number Of Pups',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'Location',
                      label: Container(
                        padding: padding16,
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
                        padding: padding16,
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
                        padding: padding16,
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
                        padding: padding16,
                        child: Text(
                          'Lateral View',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'teeth',
                      width: 130,
                      label: Container(
                        padding: padding16,
                        child: Text(
                          'Teeth View',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'gear',
                      label: Container(
                        padding: padding16,
                        child: Text(
                          'Gear Caught With',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'boat',
                      label: Container(
                        padding: padding16,
                        child: Text(
                          'Boat Type',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'catchLocation',
                      label: Container(
                        padding: padding16,
                        child: Text(
                          'Catch Location',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'boughtBy',
                      label: Container(
                        padding: padding16,
                        child: Text(
                          'Bought By',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'purpose',
                      label: Container(
                        padding: padding16,
                        child: Text(
                          'Purpose',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'priceKG',
                      label: Container(
                        padding: padding16,
                        child: Text(
                          'Price/KG',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'total',
                      label: Container(
                        padding: padding16,
                        child: Text(
                          'Total of this',
                          style: _headerTextStyle,
                        ),
                      )
                  ),
                  GridColumn(
                      columnName: 'collectedAt',
                      label: Container(
                        padding: padding16,
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
                          'dorsal', 'ventral', 'lateral', 'teeth'
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
                style: const TextStyle(
                  color: cardBackgroundColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Obx(()=>Visibility(
                visible: !controller.loading.value,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: InkWell(
                    onTap: controller.getAllData,
                    child: const Row(
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
                onTap: controller.exportSharksToCsv,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Row(
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
        const SizedBox(height: 4,),
        Container(
          height: 1,
          color: primaryColor,
        ),
      ],
    );
  }
}
