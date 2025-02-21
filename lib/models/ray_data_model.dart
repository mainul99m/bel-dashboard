import 'dart:convert';
import 'ray_model.dart';

RayDataModel rayDataModelFromJson(String str) => RayDataModel.fromJson(json.decode(str));

String rayDataModelToJson(RayDataModel data) => json.encode(data.toJson());

class RayDataModel {
  String status;
  String? message;
  int? results;
  int? total;
  int? pages;
  int? currentPage;
  RayData? data;

  RayDataModel({
    required this.status,
    this.message,
    this.results,
    this.total,
    this.pages,
    this.currentPage,
    this.data,
  });

  factory RayDataModel.fromJson(Map<String, dynamic> json) => RayDataModel(
    status: json["status"],
    results: json["results"],
    total: json["total"],
    pages: json["pages"],
    currentPage: json["currentPage"],
    data: RayData.fromJson(json["data"]),
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

class RayData{
  List<RayModel> rays;

  RayData({
    required this.rays,
  });

  factory RayData.fromJson(Map<String, dynamic> json) => RayData(
    rays: List<RayModel>.from(json["rays"].map((x) => RayModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "rays": List<dynamic>.from(rays.map((x) => x.toJson())),
  };
}