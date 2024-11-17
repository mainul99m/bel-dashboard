import 'dart:convert';

AdditionalInfoModel additionalInfoModelFromJson(String str) => AdditionalInfoModel.fromJson(json.decode(str));

String additionalInfoModelToJson(AdditionalInfoModel data) => json.encode(data.toJson());

class AdditionalInfoModel {
  String gearCoughtWith;
  double? meshSize;
  String boatType;
  String catchLocation;
  String boughtBy;
  String purpose;
  double? pricePerKg;
  int totalOfThisSpecies;

  AdditionalInfoModel({
    required this.gearCoughtWith,
    this.meshSize,
    required this.boatType,
    required this.catchLocation,
    required this.boughtBy,
    required this.purpose,
    this.pricePerKg,
    required this.totalOfThisSpecies,
  });

  factory AdditionalInfoModel.fromJson(Map<String, dynamic> json) => AdditionalInfoModel(
    gearCoughtWith: json["gear_cought_with"],
    meshSize: json["mesh_size"],
    boatType: json["boat_type"],
    catchLocation: json["catch_location"],
    boughtBy: json["bought_by"],
    purpose: json["purpose"],
    pricePerKg: json["price_per_kg"],
    totalOfThisSpecies: json["total_of_this_species"],
  );

  Map<String, dynamic> toJson() => {
    "gear_cought_with": gearCoughtWith,
    "mesh_size": meshSize,
    "boat_type": boatType,
    "catch_location": catchLocation,
    "bought_by": boughtBy,
    "purpose": purpose,
    "price_per_kg": pricePerKg,
    "total_of_this_species": totalOfThisSpecies,
  };
}