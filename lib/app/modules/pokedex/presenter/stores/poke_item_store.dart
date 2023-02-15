import 'package:mobx/mobx.dart';
import 'package:pokedex/app/modules/pokedex/domain/usecases/get_pokemon_usecase.dart';

import '../../../../core/entities/main.dart';
import '../../infra/models/main.dart';

part 'poke_item_store.g.dart';

class PokeItemStore = _PokeItemStoreBase with _$PokeItemStore;

abstract class _PokeItemStoreBase with Store {
  final GetPokemonUsecase getPokemonUsecase;

  _PokeItemStoreBase(this.getPokemonUsecase);

  @observable
  bool isLoading = false;

  @observable
  PokemonEntity? pokemon;

  @action
  Future<void> getPokemon(String id) async {
    isLoading = true;

    final result = await getPokemonUsecase(name: id);

    result.fold(onSuccess, onFailure);

    isLoading = false;
  }

  void onSuccess(PokemonEntity pokemon) {
    this.pokemon = pokemon as PokemonModel;
  }

  void onFailure(Exception exception) {}
}
