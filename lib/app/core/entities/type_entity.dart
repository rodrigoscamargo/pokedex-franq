import 'main.dart';

abstract class TypeEntity {
  TypeEntity({
    required this.slot,
    required this.type,
  });

  final int slot;
  final SpeciesEntity type;
}
