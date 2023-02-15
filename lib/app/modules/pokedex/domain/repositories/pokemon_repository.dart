import 'package:pokedex/app/core/entities/main.dart';

import 'package:result_dart/result_dart.dart';

import '../entities/main.dart';

abstract class PokemonRepository {
  Future<Result<List<PokedexEntity>, Exception>> getAllPokemons();
  Future<Result<List<PokedexEntity>, Exception>> getPokemons({required int limit, required int page});
  Future<Result<PokemonEntity, Exception>> getPokemon(String number);
}
