import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:pokedex/app/core/entities/main.dart';
import 'package:pokedex/app/shared/components/main.dart';
import 'package:pokedex/app/shared/components/type/pokemon_type_container.dart';
import 'package:pokedex/app/shared/utils/extensions/constants/theme/main.dart';
import 'package:pokedex/app/shared/utils/extensions/main.dart';

class PokemonDetailPage extends StatefulWidget {
  final PokemonEntity pokemon;
  const PokemonDetailPage({Key? key, required this.pokemon}) : super(key: key);
  @override
  PokemonDetailPageState createState() => PokemonDetailPageState();
}

class PokemonDetailPageState extends State<PokemonDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Hero(
            tag: 'pokemon/${widget.pokemon.name}/type/container',
            child: Container(
              decoration: getBoxDecoration(widget.pokemon.types),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                pinned: true,
                title: Text(widget.pokemon.name.capitalize()),
              ),
              _buildImage(widget.pokemon),
              _buildContent(widget.pokemon),
            ],
          ),
        ],
      ),
    );
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
        gradient: LinearGradient(colors: colors),
      );
    }
    Color? color;
    if (types.isNotEmpty) color = _degradeColor(types.first.color);
    return BoxDecoration(color: color);
  }

  Widget _buildImage(PokemonEntity pokemon) {
    return SliverToBoxAdapter(
      child: Hero(
        tag: 'pokemon/image/${pokemon.name}',
        child: Container(
          margin: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
              width: 8,
            ),
            color: Colors.white.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: CachedNetworkImage(
            imageUrl: pokemon.sprites.other.officialArtwork.frontDefault,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(PokemonEntity pokemon) {
    return SliverToBoxAdapter(
      child: Container(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 6,
              sigmaX: 6,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildName(pokemon),
                _buildAbilities(pokemon),
                _buildMedia(pokemon),
                const SizedBox(height: 200)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildName(PokemonEntity pokemon) {
    final shortDescription = pokemon.species.name.capitalize();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.1), width: 2),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (pokemon.species.name).capitalize(),
                  style: PokemonDetailTheme.pokemonTitleStyle(context),
                ),
                Visibility(
                  visible: shortDescription.isNotEmpty == true,
                  child: Text(
                    shortDescription,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: pokemon.types.map(_buildTypeContainer).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildTypeContainer(TypeEntity type) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: PokemonTypeContainer(
        type: type,
        size: 20,
      ),
    );
  }

  Widget _buildAbilities(PokemonEntity pokemon) {
    final description = pokemon.species.name;
    return Visibility(
      visible: description.isNotEmpty == true,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Abilities',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 22,
                fontWeight: FontWeight.w800,
                height: 1.4,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: pokemon.abilities
                  .map((ability) => Text(
                        ability.ability.capitalize(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w100,
                          fontSize: 16,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedia(PokemonEntity pokemon) {
    final sprites = [
      pokemon.sprites.other.officialArtwork.frontDefault,
      pokemon.sprites.other.dreamWorld.frontDefault,
      pokemon.sprites.other.home.frontDefault,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Media',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.75),
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 100,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            children: sprites.map(buildMediaContainer).toList(),
          ),
        )
      ],
    );
  }

  Widget buildMediaContainer(String? media) {
    return Visibility(
      visible: media != null,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        child: AspectRatio(
          aspectRatio: 1,
          child: MediaContainer(
            media: media!,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
