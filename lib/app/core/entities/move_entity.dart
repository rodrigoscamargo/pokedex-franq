import 'main.dart';

abstract class MoveEntity {
  MoveEntity({
    required this.move,
    required this.versionGroupDetails,
  });

  final SpeciesEntity move;
  final List<VersionGroupDetailEntity> versionGroupDetails;
}
