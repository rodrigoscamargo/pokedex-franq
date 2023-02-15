import 'package:flutter_modular/flutter_modular.dart';

import 'package:pokedex/app/shared/api/main.dart';

import 'domain/repositories/main.dart';
import 'domain/usecases/main.dart';
import 'external/main.dart';
import 'infra/datasources/main.dart';
import 'infra/repositories/main.dart';
import 'presenter/pages/main.dart';
import 'presenter/stores/main.dart';

class PokedexModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<Client>((i) => ClientPokedex()),
    Bind.factory<PokemonRepository>((i) => PokemonRepositoryImpl(i())),
    Bind.factory<PokemonDataSource>((i) => PokemonDataSourceImpl(i())),
    Bind.factory<GetAllPokemonsUsecase>((i) => GetAllPokemonsUsecaseImpl(i())),
    Bind.factory<GetPokemonsUsecase>((i) => GetPokemonsUsecaseImpl(i())),
    Bind.factory<GetPokemonUsecase>((i) => GetPokemonUsecaseImpl(i())),
    Bind.lazySingleton((i) => PokedexStore(i(), i(), i())),
    Bind.factory((i) => PokeItemStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [ChildRoute(Modular.initialRoute, child: (context, args) => const PokedexPage())];
}
