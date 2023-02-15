import 'package:pokedex/app/core/entities/main.dart';

class OfficialArtworkModel extends OfficialArtworkEntity {
  OfficialArtworkModel({required super.frontDefault, required super.frontShiny});

  factory OfficialArtworkModel.fromJson(Map<String, dynamic> json) => OfficialArtworkModel(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}
