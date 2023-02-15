import 'main.dart';

abstract class GameIndexEntity {
  GameIndexEntity({
    required this.gameIndex,
    required this.version,
  });

  final int gameIndex;
  final SpeciesEntity version;
}
