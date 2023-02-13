import 'package:pokedex/app/modules/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex/app/modules/pokedex/infra/datasources/pokemon_datasource.dart';

class PokemonDataSourceImpl extends PokemonDataSource {
  @override
  Future<List<PokemonEntity>> getAllPokemons() {
    // TODO: implement getAllPokemons
    throw UnimplementedError();
  }

  @override
  Future<PokemonEntity> getPokemon(String number) {
    // TODO: implement getPokemon
    throw UnimplementedError();
  }

  @override
  Future<List<PokemonEntity>> getPokemons({required int limit, required int page}) {
    // TODO: implement getPokemons
    throw UnimplementedError();
  }
}
