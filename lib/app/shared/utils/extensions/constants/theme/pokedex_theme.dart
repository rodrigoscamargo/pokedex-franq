import 'package:flutter/material.dart';

import '../styles/main.dart';

class PokedexTheme {
  static final theme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headline6: PokedexTexStyles.baseFont,
      bodyText1: PokedexTexStyles.baseFont.copyWith(
        fontWeight: FontWeight.w600,
        overflow: TextOverflow.ellipsis,
      ),
      bodyText2: PokedexTexStyles.baseFont,
    ),
  );
}
