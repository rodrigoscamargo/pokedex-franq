import 'package:pokedex/app/core/entities/main.dart';

import 'main.dart';

class SpritesModel extends SpritesEntity {
  SpritesModel({
    required super.backDefault,
    required super.backFemale,
    required super.backShiny,
    required super.backShinyFemale,
    required super.frontDefault,
    required super.frontFemale,
    required super.frontShiny,
    required super.frontShinyFemale,
    required super.other,
    required super.versions,
    // required super.animated
  });

  factory SpritesModel.fromJson(Map<String, dynamic> json) => SpritesModel(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: OtherModel.fromJson(json["other"]),
        versions: VersionsModel(),
        // animated: SpritesModel.fromJson(json["animated"]),
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": (other as OtherModel).toJson(),
        // "versions": versions.toJson(),
        // "animated": animated.toJson(),
      };
}
