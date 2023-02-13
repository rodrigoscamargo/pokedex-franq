import 'package:pokedex/app/modules/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex/app/modules/pokedex/domain/repositories/pokemon_repository.dart';
import 'package:result_dart/result_dart.dart';

abstract class GetPokemonUsecase {
  Future<Result<PokemonEntity, Exception>> call({required String number});
}

class GetPokemonUsecaseImpl implements GetPokemonUsecase {
  final PokemonRepository repository;

  GetPokemonUsecaseImpl(this.repository);

  @override
  Future<Result<PokemonEntity, Exception>> call({required String number}) async {
    var result = await repository.getPokemon(number);

    return result.fold((success) => Success(success), (failure) => Failure(failure));
  }
}
