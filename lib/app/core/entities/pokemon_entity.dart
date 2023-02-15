import 'main.dart';

abstract class PokemonEntity {
  PokemonEntity({
    required this.id,
    required this.abilities,
    // required this.baseExperience,
    // required this.forms,
    // required this.gameIndices,
    // required this.height,
    // required this.heldItems,

    // required this.isDefault,
    // required this.locationAreaEncounters,
    // required this.moves,
    required this.name,
    required this.order,
    // required this.pastTypes,
    required this.species,
    required this.sprites,
    // required this.stats,
    required this.types,
    // required this.weight,
  });

  final int id;
  final String name;
  final List<AbilityEntity> abilities;
  // final int baseExperience;
  // final List<SpeciesEntity> forms;
  // final List<GameIndexEntity> gameIndices;
  // final int height;
  // final List<dynamic> heldItems;
  // final bool isDefault;
  // final String locationAreaEncounters;
  // final List<MoveEntity> moves;
  final int order;
  // final List<dynamic> pastTypes;
  final SpeciesEntity species;
  final SpritesEntity sprites;
  // final List<StatEntity> stats;
  final List<TypeEntity> types;
  // final int weight;
}
