import 'dart:convert';
import 'additional_info_model.dart';
import 'image_model.dart';

GuitarModel guitarModelFromJson(String str) => GuitarModel.fromJson(json.decode(str));
String guitarModelToJson(GuitarModel data) => json.encode(data.toJson());

class GuitarModel {
  String species;
  double snoutLength;
  double headLength;
  double proctoralFinToFinLength;
  double dorsalFinLength;
  double preOrbitalLength;
  double totalLength;
  double weight;
  String lifeStage;
  String gender;
  double? clasperLength;
  bool? clasperIsHard;
  bool? pregnant;
  int? numberOfPups;
  String? dataCollector;
  List<double> location;
  ImageModel images;
  AdditionalInfoModel? additionalInfo;
  DateTime collectedAt;

  GuitarModel({
    required this.species,
    required this.snoutLength,
    required this.headLength,
    required this.proctoralFinToFinLength,
    required this.dorsalFinLength,
    required this.preOrbitalLength,
    required this.totalLength,
    required this.weight,
    required this.lifeStage,
    required this.gender,
    this.clasperLength,
    this.clasperIsHard,
    this.pregnant,
    this.numberOfPups,
    this.dataCollector,
    required this.location,
    required this.images,
    this.additionalInfo,
    required this.collectedAt,
  });

  factory GuitarModel.fromJson(Map<String, dynamic> json) => GuitarModel(
    species: json["species"],
    snoutLength: json["snout_length"]?.toDouble(),
    headLength: json["head_length"]?.toDouble(),
    proctoralFinToFinLength: json["proctoral_fin_to_fin_length"]?.toDouble(),
    dorsalFinLength: json["dorsal_fin_length"]?.toDouble(),
    preOrbitalLength: json["pre_orbital_length"]?.toDouble(),
    totalLength: json["total_length"]?.toDouble(),
    weight: json["weight"]?.toDouble(),
    lifeStage: json["life_stage"],
    gender: json["gender"],
    clasperLength: json["clasper_length"],
    clasperIsHard: json["clasper_isHard"],
    pregnant: json["pregnant"],
    numberOfPups: json["number_of_pups"],
    dataCollector: json["dataCollector"],
    location: List<double>.from(json["location"].map((x) => x?.toDouble())),
    images: ImageModel.fromJson(json["images"]),
    additionalInfo: AdditionalInfoModel.fromJson(json["additionalInfo"]),
    collectedAt: DateTime.parse(json["collectedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "species": species,
    "snout_length": snoutLength,
    "head_length": headLength,
    "proctoral_fin_to_fin_length": proctoralFinToFinLength,
    "dorsal_fin_length": dorsalFinLength,
    "pre_orbital_length": preOrbitalLength,
    "total_length": totalLength,
    "weight": weight,
    "life_stage": lifeStage,
    "gender": gender,
    "clasper_length": clasperLength,
    "clasper_isHard": clasperIsHard,
    "pregnant": pregnant,
    "number_of_pups": numberOfPups,
    "dataCollector": dataCollector,
    "location": List<dynamic>.from(location.map((x) => x)),
    "images": images.toJson(),
    "additionalInfo": additionalInfo?.toJson(),
    "collectedAt": collectedAt.toIso8601String(),
  };
}