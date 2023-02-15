// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokeItemStore on _PokeItemStoreBase, Store {
  late final _$isLoadingAtom = Atom(name: '_PokeItemStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$pokemonAtom = Atom(name: '_PokeItemStoreBase.pokemon', context: context);

  @override
  PokemonEntity? get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(PokemonEntity? value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  late final _$getPokemonAsyncAction = AsyncAction('_PokeItemStoreBase.getPokemon', context: context);

  @override
  Future<void> getPokemon(String id) {
    return _$getPokemonAsyncAction.run(() => super.getPokemon(id));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
pokemon: ${pokemon}
    ''';
  }
}
