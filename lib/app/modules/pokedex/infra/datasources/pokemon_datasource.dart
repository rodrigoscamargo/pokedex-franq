import 'package:pokedex/app/modules/pokedex/domain/entities/pokemon_entity.dart';

abstract class PokemonDataSource {
  Future<List<PokemonEntity>> getAllPokemons();
  Future<List<PokemonEntity>> getPokemons({required int limit, required int page});
  Future<PokemonEntity> getPokemon(String number);
}
