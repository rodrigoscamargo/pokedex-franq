import 'package:pokedex/app/core/entities/main.dart';

class SpeciesModel extends SpeciesEntity {
  SpeciesModel({required super.name, required super.url});

  factory SpeciesModel.fromJson(Map<String, dynamic> json) => SpeciesModel(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
