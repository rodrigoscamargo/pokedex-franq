import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/not_found/presenter/not_found_page.dart';

import 'counter_cubit.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CounterCubit()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (context, args) => const HomePage()),
    WildcardRoute(child: (context, args) => const NotFoundPage()),
  ];
}
