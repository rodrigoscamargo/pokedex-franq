import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:pokedex/app/modules/pokedex/domain/entities/pokemon_entity.dart';

import 'package:pokedex/app/modules/pokedex/domain/repositories/main.dart';
import 'package:pokedex/app/modules/pokedex/domain/usecases/main.dart';
import 'package:pokedex/app/modules/pokedex/infra/models/pokemon_model.dart';
import 'package:result_dart/result_dart.dart';

class MockRepository extends Mock implements PokemonRepository {}

class FakePokemon extends Fake implements PokemonModel {}

void main() {
  final repository = MockRepository();
  final usecase = GetPokemonUsecaseImpl(repository);

  group('GetPokemonUsecase', () {
    group('call:', () {
      test('Should return a pokemon', () async {
        when(
          () => repository.getPokemon('ratata'),
        ).thenAnswer((_) async => Success(FakePokemon()));

        var result = await usecase(name: 'ratata');

        expect(result.getOrNull(), isA<PokemonModel>());
      });

      test('Should throw expection', () async {
        when(
          () => repository.getPokemon('ratatadoidao'),
        ).thenAnswer((_) async => Failure(Exception()));

        var result = await usecase(name: 'ratatadoidao');

        expect(result.isError(), true);
      });
    });
  });
}
