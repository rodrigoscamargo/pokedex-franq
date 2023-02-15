import 'package:pokedex/app/core/entities/main.dart';

class HomeModel extends HomeEntity {
  HomeModel(
      {required super.frontDefault,
      required super.frontFemale,
      required super.frontShiny,
      required super.frontShinyFemale});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}
