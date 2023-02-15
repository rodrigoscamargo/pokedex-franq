import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/modules/pokedex/presenter/stores/poke_item_store.dart';

void main() {
  late ItemDexStore store;

  setUpAll(() {
    store = ItemDexStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}
