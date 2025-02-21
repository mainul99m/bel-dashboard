import 'dart:convert';
import 'package:bel_dashboard/models/shark_model.dart';

SharkDataModel sharkDataModelFromJson(String str) => SharkDataModel.fromJson(json.decode(str));

String sharkDataModelToJson(SharkDataModel data) => json.encode(data.toJson());

class SharkDataModel {
  String status;
  String? message;
  int? results;
  int? total;
  int? pages;
  int? currentPage;
  SharkData? data;

  SharkDataModel({
    required this.status,
    this.message,
    this.results,
    this.total,
    this.pages,
    this.currentPage,
    this.data,
  });

  factory SharkDataModel.fromJson(Map<String, dynamic> json) => SharkDataModel(
    status: json["status"],
    results: json["results"],
    total: json["total"],
    pages: json["pages"],
    currentPage: json["currentPage"],
    data: SharkData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "results": results,
    "total": total,
    "pages": pages,
    "currentPage": currentPage,
    "data": data?.toJson(),
  };
}

class SharkData {
  List<SharkModel> sharks;

  SharkData({
    required this.sharks,
  });

  factory SharkData.fromJson(Map<String, dynamic> json) => SharkData(
    sharks: List<SharkModel>.from(json["sharks"].map((x) => SharkModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sharks": List<dynamic>.from(sharks.map((x) => x.toJson())),
  };
}