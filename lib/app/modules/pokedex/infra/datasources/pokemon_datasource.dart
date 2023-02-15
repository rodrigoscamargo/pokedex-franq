import 'package:pokedex/app/core/entities/main.dart';

import '../../domain/entities/main.dart';

abstract class PokemonDataSource {
  Future<List<PokedexEntity>> getAllPokemons();
  Future<List<PokedexEntity>> getPokemons({required int limit, required int page});
  Future<PokemonEntity> getPokemon(String number);
}
