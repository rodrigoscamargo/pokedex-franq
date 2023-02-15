import 'package:result_dart/result_dart.dart';

import 'package:pokedex/app/core/entities/main.dart';

import '../../domain/entities/main.dart';
import '../../domain/repositories/main.dart';
import '../datasources/main.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonDataSource dataSource;

  PokemonRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<PokedexEntity>, Exception>> getAllPokemons() async {
    List<PokedexEntity> result;

    try {
      result = await dataSource.getAllPokemons();
    } on Exception catch (e) {
      return Failure(e);
    }

    return Success(result);
  }

  @override
  Future<Result<PokemonEntity, Exception>> getPokemon(String id) async {
    PokemonEntity result;
    try {
      result = await dataSource.getPokemon(id);
    } on Exception catch (e) {
      return Failure(e);
    }

    return Success(result);
  }

  @override
  Future<Result<List<PokedexEntity>, Exception>> getPokemons({required int limit, required int page}) async {
    List<PokedexEntity> result;

    try {
      result = await dataSource.getPokemons(limit: limit, page: page);
    } on Exception catch (e) {
      return Failure(e);
    }

    return Success(result);
  }
}
