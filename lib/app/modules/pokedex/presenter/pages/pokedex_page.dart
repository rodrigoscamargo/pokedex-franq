import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/pokedex/presenter/components/poke_item.dart';

import '../../infra/models/main.dart';
import '../stores/main.dart';

class PokedexPage extends StatefulWidget {
  final String title;
  const PokedexPage({Key? key, this.title = 'PokedexPage'}) : super(key: key);
  @override
  PokedexPageState createState() => PokedexPageState();
}

class PokedexPageState extends State<PokedexPage> {
  final store = Modular.get<PokedexStore>();

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    store.getPokemons();

    scrollController.addListener(() async {
      debugPrint('scrollController.position.maxScrollExtent - ${scrollController.position.maxScrollExtent}');
      debugPrint('scrollController.position.pixels - ${scrollController.position.pixels}');
      if (scrollController.position.pixels > scrollController.position.maxScrollExtent * .9) {
        if (!store.isLoading) {
          await store.getPokemons();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).padding.top - 240 / 2.9,
            left: screenWidth - (240 / 1.6),
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/pokeball_dark.png',
                color: Colors.white,
                height: 240,
                width: 240,
              ),
            ),
          ),
          Observer(builder: (context) {
            return CustomScrollView(controller: scrollController, slivers: [
              const SliverAppBar(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                centerTitle: false,
                title: Text(
                  'Pokedex',
                  style:
                      TextStyle(color: Colors.white, fontFamily: 'Google', fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
              _buildPokemonGrid(store.pokemons)
            ]);
          }),
        ],
      ),
    );
  }

  Widget _buildPokemonGrid(List<PokedexModel> data) {
    return SliverPadding(
      padding: const EdgeInsets.all(12),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.9,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return IndexedSemantics(
                index: index, child: PokeItem(id: index.toString(), name: store.pokemons[index].name));
          },
          addSemanticIndexes: true,
          childCount: data.length,
        ),
      ),
    );
  }
}
