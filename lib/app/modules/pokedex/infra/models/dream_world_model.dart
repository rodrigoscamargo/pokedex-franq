import 'package:pokedex/app/core/entities/main.dart';

class DreamWorldModel extends DreamWorldEntity {
  DreamWorldModel({required super.frontDefault, required super.frontFemale});

  factory DreamWorldModel.fromJson(Map<String, dynamic> json) => DreamWorldModel(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}
