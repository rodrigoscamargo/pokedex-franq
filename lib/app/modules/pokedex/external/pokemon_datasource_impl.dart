import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app/core/entities/main.dart';

import '../../../shared/api/main.dart';
import '../domain/entities/main.dart';
import '../infra/datasources/main.dart';
import '../infra/models/main.dart';

class PokemonDataSourceImpl extends PokemonDataSource {
  Client client;

  PokemonDataSourceImpl(this.client);

  @override
  Future<List<PokedexEntity>> getAllPokemons() async {
    List<PokedexEntity> result = [];

    try {
      var response = await client.get('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0');

      response.fold(
        (r) {
          result = List<PokedexEntity>.from(r.data["results"].map((x) => PokedexModel.fromJson(x)));
        },
        (l) => throw l,
      );
    } on DioError catch (e) {
      debugPrint(e.message);
    }

    return result;
  }

  @override
  Future<PokemonEntity> getPokemon(String id) async {
    PokemonEntity? result;

    try {
      var response = await client.get('https://pokeapi.co/api/v2/pokemon/$id');

      response.fold(
        (r) {
          result = PokemonModel.fromJson(r.data);
        },
        (l) => throw l,
      );
    } on DioError catch (e) {
      debugPrint(e.message);
    }

    return result!;
  }

  @override
  Future<List<PokedexEntity>> getPokemons({required int limit, required int page}) async {
    List<PokedexEntity> result = [];

    try {
      var response = await client.get(
        'https://pokeapi.co/api/v2/pokemon',
        queryParameters: {'limit': limit, 'offset': page * limit},
      );

      response.fold(
        (r) {
          result = List<PokedexEntity>.from(r.data["results"].map((x) => PokedexModel.fromJson(x)));
        },
        (l) => throw l,
      );
    } on DioError catch (e) {
      debugPrint(e.message);
    }

    return result;
  }
}
