import 'package:pokedex/app/modules/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex/app/modules/pokedex/domain/repositories/pokemon_repository.dart';
import 'package:result_dart/result_dart.dart';

abstract class GetAllPokemonsUsecase {
  Future<Result<List<PokedexEntity>, Exception>> call();
}

class GetAllPokemonsUsecaseImpl implements GetAllPokemonsUsecase {
  final PokemonRepository repository;

  GetAllPokemonsUsecaseImpl(this.repository);

  @override
  Future<Result<List<PokedexEntity>, Exception>> call() async {
    var result = await repository.getAllPokemons();

    return result.fold((success) => Success(success), (failure) => Failure(failure));
  }
}
