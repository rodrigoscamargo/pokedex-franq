import 'main.dart';

abstract class VersionGroupDetailEntity {
  VersionGroupDetailEntity({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  final int levelLearnedAt;
  final SpeciesEntity moveLearnMethod;
  final SpeciesEntity versionGroup;
}
