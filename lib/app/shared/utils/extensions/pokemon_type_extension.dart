import 'package:flutter/material.dart';
import 'package:pokedex/app/core/entities/main.dart';

import '../type_colors.dart';

extension PokemonTypeExtension on TypeEntity {
  Color get color => pokemonTypeColors[type.name] ?? Colors.grey;
}
