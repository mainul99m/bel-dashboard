import 'dart:convert';

ImageModel imageModelFromJson(String str) => ImageModel.fromJson(json.decode(str));

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  List<String>? dorsalView;
  List<String>? ventralView;
  List<String>? lateralView;
  List<String>? teethView;
  String id;

  ImageModel({
    this.dorsalView,
    this.ventralView,
    this.lateralView,
    this.teethView,
    required this.id,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    dorsalView: json["dorsal_view"] == null ? []: List<String>.from(json["dorsal_view"].map((x) => x)),
    ventralView: json["ventral_view"] == null ? [] : List<String>.from(json["ventral_view"].map((x) => x)),
    lateralView:json["lateral_view"] == null ? [] : List<String>.from(json["lateral_view"].map((x) => x)),
    teethView: json["teeth_view"] == null ? [] : List<String>.from(json["teeth_view"].map((x) => x)),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "dorsal_view": List<dynamic>.from(dorsalView!.map((x) => x)),
    "ventral_view": List<dynamic>.from(ventralView!.map((x) => x)),
    "lateral_view": List<dynamic>.from(lateralView!.map((x) => x)),
    "teeth_view": List<dynamic>.from(teethView!.map((x) => x)),
    "_id": id,
  };
}