import 'dart:convert';
import 'guitar_model.dart';

GuitarDataModel guitarDataModelFromJson(String str) => GuitarDataModel.fromJson(json.decode(str));
String guitarDataModelToJson(GuitarDataModel data) => json.encode(data.toJson());

class GuitarDataModel {
  String status;
  String? message;
  int? results;
  int? total;
  int? pages;
  int? currentPage;
  GuitarData? data;

  GuitarDataModel({
    required this.status,
    this.message,
    this.results,
    this.total,
    this.pages,
    this.currentPage,
    this.data,
  });

  factory GuitarDataModel.fromJson(Map<String, dynamic> json) => GuitarDataModel(
    status: json["status"],
    results: json["results"],
    total: json["total"],
    pages: json["pages"],
    currentPage: json["currentPage"],
    data: GuitarData.fromJson(json["data"]),
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

class GuitarData{
  List<GuitarModel> guitars;

  GuitarData({
    required this.guitars,
  });

  factory GuitarData.fromJson(Map<String, dynamic> json) => GuitarData(
    guitars: List<GuitarModel>.from(json["guitars"].map((x) => GuitarModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "guitars": List<dynamic>.from(guitars.map((x) => x.toJson())),
  };
}