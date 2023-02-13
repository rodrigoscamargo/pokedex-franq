import 'package:pokedex/app/modules/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex/app/modules/pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/app/modules/pokedex/infra/datasources/pokemon_datasource.dart';
import 'package:result_dart/result_dart.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonDataSource dataSource;

  PokemonRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<PokemonEntity>, Exception>> getAllPokemons() async {
    List<PokemonEntity> result;

    try {
      result = await dataSource.getAllPokemons();
    } on Exception catch (e) {
      return Failure(e);
    }

    return Success(result);
  }

  @override
  Future<Result<PokemonEntity, Exception>> getPokemon(String number) async {
    PokemonEntity result;
    try {
      result = await dataSource.getPokemon(number);
    } on Exception catch (e) {
      return Failure(e);
    }

    return Success(result);
  }

  @override
  Future<Result<List<PokemonEntity>, Exception>> getPokemons({required int limit, required int page}) async {
    List<PokemonEntity> result;

    try {
      result = await dataSource.getPokemons(limit: limit, page: page);
    } on Exception catch (e) {
      return Failure(e);
    }

    return Success(result);
  }
}
