import 'package:pokedex/app/modules/pokedex/domain/entities/pokemon_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract class PokemonRepository {
  Future<Result<List<PokemonEntity>, Exception>> getAllPokemons();
  Future<Result<List<PokemonEntity>, Exception>> getPokemons({required int limit, required int page});
  Future<Result<PokemonEntity, Exception>> getPokemon(String number);
}
