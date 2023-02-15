import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/modules/pokedex/presenter/stores/pokedex_store.dart';

void main() {
  late PokedexStore store;

  setUpAll(() {
    store = PokedexStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
