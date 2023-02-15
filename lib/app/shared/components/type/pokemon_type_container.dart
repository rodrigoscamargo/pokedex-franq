import 'package:flutter/material.dart';

import 'package:pokedex/app/core/entities/main.dart';
import 'package:pokedex/app/shared/utils/extensions/main.dart';
import 'package:pokedex/app/shared/utils/type_colors.dart';

class PokemonTypeContainer extends StatelessWidget {
  const PokemonTypeContainer({
    Key? key,
    required this.type,
    this.size = 16,
  }) : super(key: key);
  final TypeEntity type;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(
        maxHeight: size,
        minWidth: size * 3,
      ),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: pokemonTypeColors[type.type.name]!.withOpacity(0.6),
      ),
      child: Text(
        type.type.name.capitalize(),
        maxLines: 1,
        style: TextStyle(
          fontSize: size * (2 / 3),
          color: Color.lerp(
            type.color,
            Colors.white,
            0.8,
          ),
          fontWeight: FontWeight.w700,
          shadows: const [
            Shadow(
              blurRadius: 3,
            ),
          ],
        ),
      ),
    );
  }
}
