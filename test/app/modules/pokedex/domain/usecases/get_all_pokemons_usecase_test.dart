import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:pokedex/app/modules/pokedex/domain/entities/pokemon_entity.dart';

import 'package:pokedex/app/modules/pokedex/domain/repositories/main.dart';
import 'package:pokedex/app/modules/pokedex/domain/usecases/main.dart';
import 'package:pokedex/app/modules/pokedex/infra/models/pokedex_model.dart';
import 'package:result_dart/result_dart.dart';

class MockRepository extends Mock implements PokemonRepository {}

void main() {
  final repository = MockRepository();
  final usecase = GetAllPokemonsUsecaseImpl(repository);

  group('GetAllPokemonsUsecase', () {
    group('call:', () {
      test('Should return a list of pokemons', () async {
        when(
          () => repository.getAllPokemons(),
        ).thenAnswer((_) async => Success([PokedexModel(name: 'name', url: 'url')]));

        var result = await usecase();

        expect(result.getOrNull(), isA<List<PokedexEntity>>());
      });

      test('Should throw expection', () async {
        when(
          () => repository.getAllPokemons(),
        ).thenAnswer((_) async => Failure(Exception()));

        var result = await usecase();

        expect(result.isError(), true);
      });
    });
  });
}
