import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/pokedex/pokedex_module.dart';
import 'package:pokedex/app/modules/pokemon/pokemon_module.dart';

import 'modules/not_found/presenter/not_found_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: PokedexModule()),
    ModuleRoute('/pokemon', module: PokemonModule()),
    WildcardRoute(child: (context, args) => const NotFoundPage()),
  ];
}
