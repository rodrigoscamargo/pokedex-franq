import 'package:pokedex/app/modules/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex/app/modules/pokedex/domain/repositories/pokemon_repository.dart';
import 'package:result_dart/result_dart.dart';

abstract class GetPokemonsUsecase {
  Future<Result<List<PokedexEntity>, Exception>> call({required int limit, required int page});
}

class GetPokemonsUsecaseImpl implements GetPokemonsUsecase {
  final PokemonRepository repository;

  GetPokemonsUsecaseImpl(this.repository);

  @override
  Future<Result<List<PokedexEntity>, Exception>> call({required int limit, required int page}) async {
    var result = await repository.getPokemons(limit: limit, page: page);

    return result.fold((success) => Success(success), (failure) => Failure(failure));
  }
}
