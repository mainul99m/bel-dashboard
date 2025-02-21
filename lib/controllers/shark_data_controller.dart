import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:bel_dashboard/models/shark_data_model.dart';
import 'package:bel_dashboard/models/shark_model.dart';
import 'package:bel_dashboard/services/remote_service.dart';
import 'package:csv/csv.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';

import '../services/data_service.dart';


class SharkDataController extends GetxController {

  var count = 0.obs;
  var loading = true.obs;

  // List<Employee> employees = <Employee>[];
  List<SharkModel> sharks = <SharkModel>[];

  // late EmployeeDataSource employeeDataSource;
  late SharkDataSource sharkDataSource;
  final GlobalKey<SfDataGridState> sharkDataKey = GlobalKey<SfDataGridState>();




  @override
  void onInit() {
    super.onInit();
    // employeeDataSource = EmployeeDataSource(employees: employees);
    sharkDataSource = SharkDataSource(sharks: sharks);
    getData();

    print("SharkDataController Initiated");

  }

  Future<void> getData() async {
    loading.value = true;
    SharkDataModel? data = await RemoteService.getSharks();
    // await Future.delayed(Duration(seconds: 2));
    // employees = getEmployees();
    // employeeDataSource = EmployeeDataSource(employees: employees);
    count.value = data!.data!.sharks.length;
    sharks = data.data!.sharks;
    sharkDataSource = SharkDataSource(sharks: sharks);
    loading.value = false;
  }

  Future<void> getAllData() async{

    if(!loading.value){
      loading.value = true;
      SharkDataModel? data = await RemoteService.getSharks(limit: 100000);
      // await Future.delayed(Duration(seconds: 2));
      // employees = getEmployees();
      // employeeDataSource = EmployeeDataSource(employees: employees);
      count.value = data!.data!.sharks.length;
      sharks = data.data!.sharks;
      sharkDataSource = SharkDataSource(sharks: sharks);
    }
    loading.value = false;
  }

  void exportSharksToCsv(){
    print("Exporting Sharks to CSV");
    final List<List<dynamic>> data = [];
    data.add([
        'species',
        'totalLength',
        'forkLength',
        'dorsalFinLength',
        'lifeStage',
        'gender',
        'clasperLength',
        'clasperIsHard',
        'pregnant',
        'numberOfPups',
        'lat',
        'long',
        'dorsalImg',
        'ventralImg',
        'lateralImg',
        'teethImg',
        'gear',
        'boat',
        'catchLocation',
        'boughtBy',
        'purpose',
        'pricePerKg',
        'totalOfThisSpecies',
        'collectedAt',
    ]);
    for (var shark in sharks){
      data.add([
        shark.species,
        shark.totalLength ?? 'N/A',
        shark.forkLength?? 'N/A',
        shark.dorsalFinLength?? 'N/A',
        shark.lifeStage,
        shark.gender,
        shark.clasperLength ?? 'N/A',
        shark.clasperIsHard ?? 'N/A',
        shark.pregnant ?? 'N/A',
        shark.numberOfPups ?? 'N/A',
        shark.location[0],
        shark.location[1],
        shark.images.dorsalView ?? 'N/A',
        // shark.images.dorsalView[1] ?? 'N/A',
        // shark.images.dorsalView[2] ?? 'N/A',
        shark.images.ventralView ?? 'N/A',
        // shark.images.ventralView[1] ?? 'N/A',
        // shark.images.ventralView[2] ?? 'N/A',
        shark.images.lateralView ?? 'N/A',
        // shark.images.lateralView[1] ?? 'N/A',
        // shark.images.lateralView[2] ?? 'N/A',
        shark.images.teethView ?? 'N/A',
        // shark.images.teethView[1] ?? 'N/A',
        // shark.images.teethView[2] ?? 'N/A',
        shark.additionalInfo!.gearCoughtWith,
        shark.additionalInfo!.boatType,
        shark.additionalInfo!.catchLocation,
        shark.additionalInfo!.boughtBy,
        shark.additionalInfo!.purpose,
        shark.additionalInfo!.pricePerKg ?? 'N/A',
        shark.additionalInfo!.totalOfThisSpecies,
        shark.collectedAt,
      ]);
  }

    DataService.saveCsv(data, 'sharks.csv');
  }



}



class SharkDataSource extends DataGridSource{
  SharkDataSource({required List<SharkModel> sharks}){
    _sharks = sharks.map<DataGridRow>((shark){
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'species', value: shark.species),
        DataGridCell<double>(columnName: 'totalLength', value: shark.totalLength ?? 0.0),
        DataGridCell<double>(columnName: 'forkLength', value: shark.forkLength ?? 0.0),
        DataGridCell<double>(columnName: 'dorsalFinLength', value: shark.dorsalFinLength ?? 0.0),
        DataGridCell<String>(columnName: 'lifeStage', value: shark.lifeStage),
        DataGridCell<String>(columnName: 'gender', value: shark.gender),
        DataGridCell<double>(columnName: 'clasperLength', value: shark.clasperLength),
        DataGridCell<bool>(columnName: 'clasperIsHard', value: shark.clasperIsHard),
        DataGridCell<bool>(columnName: 'pregnant', value: shark.pregnant),
        DataGridCell<int>(columnName: 'numberOfPups', value: shark.numberOfPups),
        // DataGridCell<String>(columnName: 'dataCollector', value: shark.dataCollector),
        DataGridCell<List<double>>(columnName: 'location', value: shark.location),
        DataGridCell<List<String>>(columnName: 'dorsal', value: shark.images.dorsalView),
        DataGridCell<List<String>>(columnName: 'ventral', value: shark.images.ventralView),
        DataGridCell<List<String>>(columnName: 'lateral', value: shark.images.lateralView),
        DataGridCell<List<String>>(columnName: 'teeth', value: shark.images.teethView),
        DataGridCell<String>(columnName: 'gear', value: shark.additionalInfo!.gearCoughtWith),
        DataGridCell<String>(columnName: 'boat', value: shark.additionalInfo!.boatType),
        DataGridCell<String>(columnName: 'catchLocation', value: shark.additionalInfo!.catchLocation),
        DataGridCell<String>(columnName: 'boughtBy', value: shark.additionalInfo!.boughtBy),
        DataGridCell<String>(columnName: 'purpose', value: shark.additionalInfo!.purpose),
        DataGridCell<double>(columnName: 'priceKG', value: shark.additionalInfo!.pricePerKg),
        DataGridCell<int>(columnName: 'total', value: shark.additionalInfo!.totalOfThisSpecies),
        DataGridCell<DateTime>(columnName: 'collectedAt', value: shark.collectedAt),
      ]);
    }).toList();
  }

  List<DataGridRow> _sharks = [];

  @override
  List<DataGridRow> get rows => _sharks;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row){
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell){
        if( dataGridCell.columnName == 'dorsal' ||
            dataGridCell.columnName == 'ventral' ||
            dataGridCell.columnName == 'lateral' ||
            dataGridCell.value == 'teeth'){

          if(dataGridCell.value != null) {
            final List<String> images = dataGridCell.value;
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: images.map((image) {
                    return IconButton(
                      onPressed: (){
                        final imageUrl = "https://images.bengalelasmolab.org/" + image;
                        _launchURL(imageUrl);
                      },
                      icon: Icon(
                        Icons.image,
                        color: Colors.blue,
                      )
                    );
                  }).toList(),
                )
            );
          }
        }
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(dataGridCell.value.toString()),
        );
      }).toList(),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.platformDefault);
    } else {
      Get.snackbar('Not a valid URL', "The Url you provide is not valid");
    }
  }

}

