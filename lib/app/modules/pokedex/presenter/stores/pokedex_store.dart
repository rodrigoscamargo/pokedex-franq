import 'package:mobx/mobx.dart';

import '../../domain/entities/main.dart';
import '../../domain/usecases/main.dart';
import '../../infra/models/main.dart';

part 'pokedex_store.g.dart';

class PokedexStore = _PokedexStoreBase with _$PokedexStore;

abstract class _PokedexStoreBase with Store {
  final GetAllPokemonsUsecase getAllPokemonsUsecase;
  final GetPokemonsUsecase getPokemonsUsecase;
  final GetPokemonUsecase getPokemonUsecase;

  _PokedexStoreBase(this.getAllPokemonsUsecase, this.getPokemonsUsecase, this.getPokemonUsecase);

  @observable
  bool isLoading = false;

  @observable
  List<PokedexModel> pokemons = [];

  int page = 1;

  bool canPaginate = true;

  @action
  Future<void> getAllPokemons() async {
    isLoading = true;

    final result = await getAllPokemonsUsecase();

    result.fold(onGetAllSuccess, onGetAllFailure);

    isLoading = false;
  }

  @action
  Future<void> getPokemons() async {
    isLoading = true;
    if (canPaginate) {
      const int limit = 20;

      final result = await getPokemonsUsecase(limit: limit, page: page);

      result.fold(onPaginationSuccess, onPaginationFailure);

      result.fold((success) {
        if (success.length < limit) {
          canPaginate = false;
        } else {
          page++;
        }
      }, (failure) => null);

      isLoading = false;
    }
  }

  void onPaginationSuccess(List<PokedexEntity> pokemons) {
    this.pokemons.addAll(pokemons.cast());
    this.pokemons = this.pokemons;
  }

  void onGetAllSuccess(List<PokedexEntity> pokemons) {
    this.pokemons = pokemons.cast();
  }

  void onGetAllFailure(Exception exception) {}
  void onPaginationFailure(Exception exception) {}
}
