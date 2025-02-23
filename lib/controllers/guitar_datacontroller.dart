import 'package:bel_dashboard/models/guitar_data_model.dart';
import 'package:bel_dashboard/models/guitar_model.dart';
import 'package:bel_dashboard/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../services/remote_service.dart';

class GuitarDataController extends GetxController {
  var count = 0.obs;
  var loading = true.obs;

  List<GuitarModel> guitars = <GuitarModel>[];
  late GuitarDataSource guitarDataSource;
  final GlobalKey<SfDataGridState> guitarDataKey = GlobalKey<SfDataGridState>();

  @override
  void onInit() {
    super.onInit();
    guitarDataSource = GuitarDataSource(guitars: guitars);
    getData();

    print("GuitarDataController Initiated");
  }

  void getData() async{
    loading.value = true;
    GuitarDataModel? data = await RemoteService.getGuitars();
    count.value = data.data!.guitars.length;
    guitars = data.data!.guitars;
    print("Guitars: ${guitars.length}");
    guitarDataSource = GuitarDataSource(guitars: guitars);
    loading.value = false;
  }

  void getAllData() async{
    if(!loading.value){
      loading.value = true;
      GuitarDataModel? data = await RemoteService.getGuitars(limit: 100000);
      count.value = data.data!.guitars.length;
      guitars = data.data!.guitars;
      guitarDataSource = GuitarDataSource(guitars: guitars);
    }
    loading.value = false;
  }

  void exportGuitarToCsv() async {
    final List<List<dynamic>> data = [];
    data.add([
      'species',
      'snoutLength',
      'headLength',
      'proctoralFinToFinLength',
      'dorsalFinLength',
      'preOrbitalLength',
      'totalLength',
      'weight',
      'lifeStage',
      'gender',
      'clasperLength',
      'clasperIsHard',
      'pregnant',
      'numberOfPups',
      'lat',
      'lon',
      'dorsal',
      'ventral',
      'lateral',
      'gear',
      'boat',
      'catchLocation',
      'boughtBy',
      'purpose',
      'priceKG',
      'total',
      'collectedAt'
    ]);

    guitars.forEach((guitar) {
      data.add([
        guitar.species,
        guitar.snoutLength,
        guitar.headLength,
        guitar.proctoralFinToFinLength,
        guitar.dorsalFinLength,
        guitar.preOrbitalLength,
        guitar.totalLength,
        guitar.weight,
        guitar.lifeStage,
        guitar.gender,
        guitar.clasperLength,
        guitar.clasperIsHard,
        guitar.pregnant,
        guitar.numberOfPups,
        guitar.location[0],
        guitar.location[1],
        guitar.images.dorsalView,
        guitar.images.ventralView,
        guitar.images.lateralView,
        guitar.additionalInfo!.gearCoughtWith,
        guitar.additionalInfo!.boatType,
        guitar.additionalInfo!.catchLocation,
        guitar.additionalInfo!.boughtBy,
        guitar.additionalInfo!.purpose,
        guitar.additionalInfo!.pricePerKg,
        guitar.additionalInfo!.totalOfThisSpecies,
        guitar.collectedAt
      ]);
    });

    DataService.saveCsv(data, 'Guitar.csv');
  }

}

class GuitarDataSource extends DataGridSource{
  GuitarDataSource({required List<GuitarModel> guitars}){
    _guitars = guitars.map<DataGridRow>((guitar){
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'species', value: guitar.species),
        DataGridCell<double>(columnName: 'snoutLength', value: guitar.snoutLength),
        DataGridCell<double>(columnName: 'headLength', value: guitar.headLength),
        DataGridCell<double>(columnName: 'proctoralFinToFinLength', value: guitar.proctoralFinToFinLength),
        DataGridCell<double>(columnName: 'dorsalFinLength', value: guitar.dorsalFinLength),
        DataGridCell<double>(columnName: 'preOrbitalLength', value: guitar.preOrbitalLength),
        DataGridCell<double>(columnName: 'totalLength', value: guitar.totalLength),
        DataGridCell<double>(columnName: 'weight', value: guitar.weight),
        DataGridCell<String>(columnName: 'lifeStage', value: guitar.lifeStage),
        DataGridCell<String>(columnName: 'gender', value: guitar.gender),
        DataGridCell<double>(columnName: 'clasperLength', value: guitar.clasperLength),
        DataGridCell<bool>(columnName: 'clasperIsHard', value: guitar.clasperIsHard),
        DataGridCell<bool>(columnName: 'pregnant', value: guitar.pregnant),
        DataGridCell<int>(columnName: 'numberOfPups', value: guitar.numberOfPups),
        DataGridCell<List<double>>(columnName: 'location', value: guitar.location),
        DataGridCell<List<String>>(columnName: 'dorsal', value: guitar.images.dorsalView),
        DataGridCell<List<String>>(columnName: 'ventral', value: guitar.images.ventralView),
        DataGridCell<List<String>>(columnName: 'lateral', value: guitar.images.lateralView),
        DataGridCell<String>(columnName: 'gear', value: guitar.additionalInfo!.gearCoughtWith),
        DataGridCell<String>(columnName: 'boat', value: guitar.additionalInfo!.boatType),
        DataGridCell<String>(columnName: 'catchLocation', value: guitar.additionalInfo!.catchLocation),
        DataGridCell<String>(columnName: 'boughtBy', value: guitar.additionalInfo!.boughtBy),
        DataGridCell<String>(columnName: 'purpose', value: guitar.additionalInfo!.purpose),
        DataGridCell<double>(columnName: 'priceKG', value: guitar.additionalInfo!.pricePerKg),
        DataGridCell<int>(columnName: 'total', value: guitar.additionalInfo!.totalOfThisSpecies),
        DataGridCell<DateTime>(columnName: 'collectedAt', value: guitar.collectedAt),
      ]);
    }).toList();
  }

  List<DataGridRow> _guitars = [];

  @override
  List<DataGridRow> get rows => _guitars;


  @override
  DataGridRowAdapter? buildRow(DataGridRow row){
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell){
        if( dataGridCell.columnName == 'dorsal' ||
            dataGridCell.columnName == 'ventral' ||
            dataGridCell.columnName == 'lateral'){

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