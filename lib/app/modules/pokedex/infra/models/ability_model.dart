import 'package:pokedex/app/core/entities/main.dart';

class AbilityModel extends AbilityEntity {
  AbilityModel({required super.ability, required super.isHidden, required super.slot});

  factory AbilityModel.fromJson(Map<String, dynamic> json) => AbilityModel(
        ability: json["ability"]["name"],
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );
}
