import 'package:pokedex/app/core/entities/main.dart';
import 'package:pokedex/app/modules/pokedex/infra/models/main.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel(
      {required super.id,
      required super.name,
      required super.order,
      required super.sprites,
      required super.species,
      required super.types,
      required super.abilities});

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        abilities: List<AbilityModel>.from(json["abilities"].map((x) => AbilityModel.fromJson(x))),
        // baseExperience: json["base_experience"],
        // forms: List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
        // gameIndices: List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromJson(x))),
        // height: json["height"],
        // heldItems: List<dynamic>.from(json["held_items"].map((x) => x)),
        id: json["id"],
        // isDefault: json["is_default"],
        // locationAreaEncounters: json["location_area_encounters"],
        // moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        name: json["name"],
        order: json["order"],
        // pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        species: SpeciesModel.fromJson(json["species"]),
        sprites: SpritesModel.fromJson(json["sprites"]),
        // stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<TypeModel>.from(json["types"].map((x) => TypeModel.fromJson(x))),
        // weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        // "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        // "base_experience": baseExperience,
        // "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
        // "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toJson())),
        // "height": height,
        // "held_items": List<dynamic>.from(heldItems.map((x) => x)),
        "id": id,
        // "is_default": isDefault,
        // "location_area_encounters": locationAreaEncounters,
        // "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
        "name": name,
        "order": order,
        // "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
        // "species": species.toJson(),
        // "sprites": sprites.toJson(),
        // "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        // "types": List<dynamic>.from(types.map((x) => x.toJson())),
        // "weight": weight,
      };
}
