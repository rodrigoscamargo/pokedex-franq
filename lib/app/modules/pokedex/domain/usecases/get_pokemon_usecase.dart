import 'package:pokedex/app/core/entities/main.dart';

import 'package:result_dart/result_dart.dart';

import '../entities/main.dart';
import '../repositories/main.dart';

abstract class GetPokemonUsecase {
  Future<Result<PokemonEntity, Exception>> call({required String name});
}

class GetPokemonUsecaseImpl implements GetPokemonUsecase {
  final PokemonRepository repository;

  GetPokemonUsecaseImpl(this.repository);

  @override
  Future<Result<PokemonEntity, Exception>> call({required String name}) async {
    var result = await repository.getPokemon(name);

    return result.fold((success) => Success(success), (failure) => Failure(failure));
  }
}
