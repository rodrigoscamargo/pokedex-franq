import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:pokedex/app/core/entities/pokemon_entity.dart';
import 'package:pokedex/app/modules/pokedex/domain/entities/pokemon_entity.dart';

import 'package:pokedex/app/modules/pokedex/infra/datasources/main.dart';
import 'package:pokedex/app/modules/pokedex/infra/repositories/main.dart';

class MockDS extends Mock implements PokemonDataSource {}

class FakePokedex extends Fake implements PokedexEntity {}

class FakePokemon extends Fake implements PokemonEntity {}

void main() {
  final ds = MockDS();
  final rep = PokemonRepositoryImpl(ds);

  group('PokemonRepository', () {
    group('getAllPokemons:', () {
      test(
        'Should throw Exception',
        () async {
          when(() => ds.getAllPokemons()).thenThrow(Exception());

          var result = await rep.getAllPokemons();

          expect(result.isError(), true);
        },
      );

      test('Should return a <List<PokedexModel>>', () async {
        when(() => ds.getAllPokemons()).thenAnswer((_) async => [FakePokedex(), FakePokedex()]);

        var result = await rep.getAllPokemons();

        expect(result.getOrNull(), isA<List<PokedexEntity>>());
      });
    });

    group('getPokemon:', () {
      test(
        'Should throw Exception',
        () async {
          when(() => ds.getPokemon(any())).thenThrow(Exception());

          var result = await rep.getPokemon('id');

          expect(result.isError(), true);
        },
      );

      test('Should return a PokedexModel', () async {
        when(() => ds.getPokemon(any())).thenAnswer((_) async => FakePokemon());

        var result = await rep.getPokemon('id');

        expect(result.getOrNull(), isA<PokemonEntity>());
      });
    });
  });
}
