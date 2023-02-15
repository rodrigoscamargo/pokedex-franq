abstract class AbilityEntity {
  AbilityEntity({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  final String ability;
  final bool isHidden;
  final int slot;
}
