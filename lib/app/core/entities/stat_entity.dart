import 'main.dart';

abstract class StatEntity {
  StatEntity({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  final int baseStat;
  final int effort;
  final SpeciesEntity stat;
}
