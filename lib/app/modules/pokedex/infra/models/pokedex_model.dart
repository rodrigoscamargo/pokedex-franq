import '../../domain/entities/main.dart';

class PokedexModel extends PokedexEntity {
  PokedexModel({required super.name, required super.url});

  factory PokedexModel.fromJson(Map<String, dynamic> json) => PokedexModel(
        name: json["name"],
        url: json["url"],
      );
}
