import 'package:bel_dashboard/models/shark_data_model.dart';
import 'package:bel_dashboard/services/remote_service.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';

class SharkDataController extends GetxController {

  var count = 0.obs;

  List<Employee> employees = <Employee>[];

  late EmployeeDataSource employeeDataSource;



  @override
  void onInit() {
    super.onInit();
    employeeDataSource = EmployeeDataSource(employees: employees);
    getData();

    print("SharkDataController Initiated");

  }

  Future<void> getData() async {
    SharkDataModel? data = await RemoteService.getSharks();
    print(data);
    await Future.delayed(Duration(seconds: 2));
    employees = getEmployees();
    employeeDataSource = EmployeeDataSource(employees: employees);
    count.value = employees.length;
  }


  List<Employee> getEmployees() {
    return[
      Employee(10001, 'James', 'Project Lead', 20000),
      Employee(10002, 'Kathryn', 'Manager', 30000),
      Employee(10003, 'Lara', 'Developer', 15000),
      Employee(10004, 'Michael', 'Designer', 15000),
      Employee(10005, 'Martin', 'Developer', 15000),
      Employee(10006, 'Newberry', 'Developer', 15000),
      Employee(10007, 'Balnc', 'Developer', 15000),
      Employee(10008, 'Perry', 'Developer', 15000),
      Employee(10009, 'Gable', 'Developer', 15000),
      Employee(10010, 'Grimes', 'Developer', 15000)
    ];
  }



}

class Employee {
  Employee(this.id, this.name, this.designation, this.salary);
  final int id;
  final String name;
  final String designation;
  final int salary;
}

class EmployeeDataSource extends DataGridSource{

  EmployeeDataSource({required List<Employee> employees}){
    _employees = employees.map<DataGridRow>((employee){
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'id', value: employee.id),
        DataGridCell<String>(columnName: 'name', value: employee.name),
        DataGridCell<String>(columnName: 'designation', value: employee.designation),
        DataGridCell<int>(columnName: 'salary', value: employee.salary),
      ]);
    }).toList();
  }

  List <DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row){
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell){
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(dataGridCell.value.toString()),
        );
      }).toList(),
    );
  }
}

