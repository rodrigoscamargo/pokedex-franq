import 'package:pokedex/app/core/entities/main.dart';
import 'package:pokedex/app/modules/pokedex/infra/models/main.dart';

class TypeModel extends TypeEntity {
  TypeModel({required super.slot, required super.type});

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        slot: json["slot"],
        type: SpeciesModel.fromJson(json["type"]),
      );
}
