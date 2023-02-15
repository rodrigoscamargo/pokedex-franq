import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/pokemon/presenter/pages/pokemon_detail_page.dart';

class PokemonModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/create', child: (context, args) => const Placeholder()),
    ChildRoute('/detail', child: (context, args) => PokemonDetailPage(pokemon: args.data['pokemon'])),
  ];
}
