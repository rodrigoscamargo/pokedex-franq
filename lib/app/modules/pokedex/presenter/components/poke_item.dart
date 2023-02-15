import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/core/entities/main.dart';
import 'package:pokedex/app/modules/pokedex/infra/models/main.dart';
import 'package:pokedex/app/modules/pokedex/presenter/stores/main.dart';
import 'package:pokedex/app/shared/utils/extensions/main.dart';

class PokeItem extends StatefulWidget {
  final String? id;
  final String? name;

  const PokeItem({Key? key, this.id, this.name}) : super(key: key);

  @override
  State<PokeItem> createState() => _PokeItemState();
}

class _PokeItemState extends State<PokeItem> {
  final store = Modular.get<PokeItemStore>();

  @override
  void initState() {
    super.initState();
    store.getPokemon(widget.name!);
  }

  Widget setTypes() {
    List<Widget> types = [];
    for (var type in store.pokemon!.types) {
      types.add(
        Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: const Color.fromARGB(80, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  type.type.name.trim(),
                  style: const TextStyle(
                      fontFamily: 'Google', fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: types,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (store.isLoading) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 90),
          decoration: getBoxDecoration([TypeModel(slot: 1, type: SpeciesModel(name: 'water', url: ''))]),
          child: const SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                strokeWidth: 1,
                color: Colors.white,
              )),
        );
      }

      return InkWell(
        onTap: () => Modular.to.pushNamed('/pokemon/detail', arguments: {'pokemon': store.pokemon}),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: getBoxDecoration(store.pokemon!.types),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Hero(
                      tag: '${widget.name!}roatation',
                      child: Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          'assets/images/pokeball.png',
                          height: 130,
                          width: 130,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Text(
                          store.pokemon?.name.capitalize() ?? '',
                          style: const TextStyle(
                              fontFamily: 'Google', fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: setTypes(),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Hero(
                      tag: 'pokemon/image/${widget.name}',
                      child: CachedNetworkImage(
                        imageUrl: store.pokemon?.sprites.other.officialArtwork.frontDefault ?? '',
                        alignment: Alignment.bottomRight,
                        height: 120,
                        width: 120,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  BoxDecoration getBoxDecoration(List<TypeEntity>? types) {
    Color _degradeColor(Color color) {
      return Color.lerp(color, Colors.grey, 0.4)!.withOpacity(0.6);
    }

    types ??= [];
    if (types.length == 2) {
      final colors = types.map((e) {
        return _degradeColor(e.color);
      }).toList();
      return BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: colors),
      );
    }
    Color? color;
    if (types.isNotEmpty) color = _degradeColor(types.first.color);
    return BoxDecoration(
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    );
  }
}
