import 'package:bel_dashboard/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../models/ray_data_model.dart';
import '../models/ray_model.dart';
import '../services/remote_service.dart';
import '../services/data_service.dart';

class RayDataController extends GetxController{

    var count = 0.obs;
    var loading = true.obs;

    List<RayModel> rays = <RayModel>[];

    late RayDataSource rayDataSource;
    final GlobalKey<SfDataGridState> rayDataKey = GlobalKey<SfDataGridState>();

    @override
    void onInit() {
      super.onInit();

      rayDataSource = RayDataSource(rays: rays);
      getData();

      print("RayDataController Initiated");

    }

    Future<void> getData() async {
      loading.value = true;
      RayDataModel? data = await RemoteService.getRays();
      count.value = data!.data!.rays.length;
      rays = data.data!.rays;
      rayDataSource = RayDataSource(rays: rays);
      print('Get Data Called');
      print('Ray count-> ${count.value}');

      loading.value = false;
    }

    Future<void> getAllData() async{
      if(!loading.value){
        loading.value = true;
        RayDataModel? data = await RemoteService.getRays(limit: 100000);
        count.value = data!.data!.rays.length;
        rays = data.data!.rays;
        rayDataSource = RayDataSource(rays: rays);
        loading.value = false;
      }
    }

    void exportRaystoCsv() {
      final List<List<dynamic>> data = <List<dynamic>>[];
      data.add([
        'species',
        'diskLength',
        'diskWidth',
        'tailLength',
        'weight',
        'lifeStage',
        'gender',
        'clasperLength',
        'clasperIsHard',
        'pregnant',
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
      for (var ray in rays) {
        data.add([
          ray.species,
          ray.diskLength,
          ray.diskWidth,
          ray.tailLength,
          ray.weight,
          ray.lifeStage,
          ray.gender,
          ray.clasperLength,
          ray.clasperIsHard,
          ray.pregnant,
          ray.location[0],
          ray.location[1],
          ray.images.dorsalView,
          ray.images.ventralView,
          ray.images.lateralView,
          ray.additionalInfo!.gearCoughtWith,
          ray.additionalInfo!.boatType,
          ray.additionalInfo!.catchLocation,
          ray.additionalInfo!.boughtBy,
          ray.additionalInfo!.purpose,
          ray.additionalInfo!.pricePerKg,
          ray.additionalInfo!.totalOfThisSpecies,
          ray.collectedAt
        ]);
      }

      DataService.saveCsv(data, 'Rays.csv');
    }
}

class RayDataSource extends DataGridSource{
  RayDataSource({required List<RayModel> rays}){
    _rays = rays.map<DataGridRow>((ray) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'species', value: ray.species),
        DataGridCell<double>(columnName: 'diskLength', value: ray.diskLength),
        DataGridCell<double>(columnName: 'diskWidth', value: ray.diskWidth),
        DataGridCell<double>(columnName: 'tailLength', value: ray.tailLength),
        DataGridCell<double>(columnName: 'weight', value: ray.weight),
        DataGridCell<String>(columnName: 'lifeStage', value: ray.lifeStage),
        DataGridCell<String>(columnName: 'gender', value: ray.gender),
        DataGridCell<double>(columnName: 'clasperLength', value: ray.clasperLength),
        DataGridCell<bool>(columnName: 'clasperIsHard', value: ray.clasperIsHard),
        DataGridCell<bool>(columnName: 'pregnant', value: ray.pregnant),
        DataGridCell<List<double>>(columnName: 'location', value: ray.location),
        DataGridCell<List<String>>(columnName: 'dorsal', value: ray.images.dorsalView),
        DataGridCell<List<String>>(columnName: 'ventral', value: ray.images.ventralView),
        DataGridCell<List<String>>(columnName: 'lateral', value: ray.images.lateralView),
        DataGridCell<String>(columnName: 'gear', value: ray.additionalInfo!.gearCoughtWith),
        DataGridCell<String>(columnName: 'boat', value: ray.additionalInfo!.boatType),
        DataGridCell<String>(columnName: 'catchLocation', value: ray.additionalInfo!.catchLocation),
        DataGridCell<String>(columnName: 'boughtBy', value: ray.additionalInfo!.boughtBy),
        DataGridCell<String>(columnName: 'purpose', value: ray.additionalInfo!.purpose),
        DataGridCell<double>(columnName: 'priceKG', value: ray.additionalInfo!.pricePerKg),
        DataGridCell<int>(columnName: 'total', value: ray.additionalInfo!.totalOfThisSpecies),
        DataGridCell<DateTime>(columnName: 'collectedAt', value: ray.collectedAt),

      ]);
    }).toList();
  }

  List<DataGridRow> _rays = [];

  @override
  List<DataGridRow> get rows => _rays;

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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: images.map((image) {
                    return IconButton(
                        onPressed: (){
                          final imageUrl = "https://images.bengalelasmolab.org/" + image;
                          _launchURL(imageUrl);
                        },
                        icon: const Icon(
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