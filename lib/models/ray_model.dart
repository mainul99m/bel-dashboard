import 'dart:convert';
import 'additional_info_model.dart';
import 'image_model.dart';

RayModel rayModelFromJson(String str) => RayModel.fromJson(json.decode(str));

String rayModelToJson(RayModel data) => json.encode(data.toJson());

class RayModel {
  String species;
  double? diskLength;
  double? diskWidth;
  double? tailLength;
  double? preOrbitalLength;
  double? weight;
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

  RayModel({
    required this.species,
    this.diskLength,
    this.diskWidth,
    this.tailLength,
    this.preOrbitalLength,
    this.weight,
    required this.lifeStage,
    required this.gender,
    this.clasperLength,
    this.clasperIsHard,
    required this.pregnant,
    this.numberOfPups,
    this.dataCollector,
    required this.location,
    required this.images,
    this.additionalInfo,
    required this.collectedAt,
  });

  factory RayModel.fromJson(Map<String, dynamic> json) => RayModel(
    species: json["species"],
    diskLength: json["disk_length"]?.toDouble(),
    diskWidth: json["disk_width"]?.toDouble(),
    tailLength: json["tail_length"],
    preOrbitalLength: json["pre_orbital_length"]?.toDouble(),
    weight: json["weight"],
    lifeStage: json["life_stage"],
    gender: json["gender"],
    clasperLength: json["clasper_length"],
    clasperIsHard: json["clasper_isHard"],
    pregnant: json["pregnant"],
    numberOfPups: json["numberOfPups"],
    dataCollector: json["dataCollector"],
    location: List<double>.from(json["location"].map((x) => x?.toDouble())),
    images: ImageModel.fromJson(json["images"]),
    additionalInfo: AdditionalInfoModel.fromJson(json["additionalInfo"]),
    collectedAt: DateTime.parse(json["collectedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "species": species,
    "disk_length": diskLength,
    "disk_width": diskWidth,
    "tail_length": tailLength,
    "pre_orbital_length": preOrbitalLength,
    "weight": weight,
    "life_stage": lifeStage,
    "gender": gender,
    "clasper_length": clasperLength,
    "clasper_isHard": clasperIsHard,
    "pregnant": pregnant,
    "numberOfPups": numberOfPups,
    "dataCollector": dataCollector,
    "location": List<dynamic>.from(location.map((x) => x)),
    "images": images.toJson(),
    "additionalInfo": additionalInfo?.toJson(),
    "collectedAt": collectedAt.toIso8601String(),
  };
}