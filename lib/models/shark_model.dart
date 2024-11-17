import 'dart:convert';
import 'additional_info_model.dart';
import 'image_model.dart';

SharkModel sharkModelFromJson(String str) => SharkModel.fromJson(json.decode(str));

String sharkModelToJson(SharkModel data) => json.encode(data.toJson());

class SharkModel {
  String species;
  double? totalLength;
  double? forkLength;
  double? dorsalFinLength;
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

  SharkModel({
    required this.species,
    this.totalLength,
    this.forkLength,
    this.dorsalFinLength,
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

  factory SharkModel.fromJson(Map<String, dynamic> json) => SharkModel(
    species: json["species"],
    totalLength: json["total_length"],
    forkLength: json["fork_length"],
    dorsalFinLength: json["dorsal_fin_length"],
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
    "total_length": totalLength,
    "fork_length": forkLength,
    "dorsal_fin_length": dorsalFinLength,
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