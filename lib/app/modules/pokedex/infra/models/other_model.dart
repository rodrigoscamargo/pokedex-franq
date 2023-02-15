import 'package:pokedex/app/core/entities/main.dart';

import 'main.dart';

class OtherModel extends OtherEntity {
  OtherModel({required super.dreamWorld, required super.home, required super.officialArtwork});

  factory OtherModel.fromJson(Map<String, dynamic> json) => OtherModel(
        dreamWorld: DreamWorldModel.fromJson(json["dream_world"]),
        home: HomeModel.fromJson(json["home"]),
        officialArtwork: OfficialArtworkModel.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "dream_world": (dreamWorld as DreamWorldModel).toJson(),
        "home": (home as HomeModel).toJson(),
        "official-artwork": (officialArtwork as OfficialArtworkModel).toJson(),
      };
}
