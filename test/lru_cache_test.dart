import 'package:lru_cache/lru_cache.dart';
import 'package:test/test.dart';

void main() {
  group('LRUCache', () {
    test('Should store and retrieve values', () {
      final cache = LRUCache<int, String>(2);
      cache.put(1, 'one');
      cache.put(2, 'two');

      expect(cache.get(1), 'one');
      expect(cache.get(2), 'two');
    });

    test('Should evit the least recently used item', () {
      final cache = LRUCache<int, String>(2);
      cache.put(1, 'one');
      cache.put(2, 'two');
      cache.put(3, 'three');

      expect(cache.get(1), null);
      expect(cache.get(2), 'two');
      expect(cache.get(3), 'three');
    });

    test('Should evit the least recently used item (out of order)', () {
      final cache = LRUCache<int, String>(2);
      cache.put(1, 'one');
      cache.put(2, 'two');
      cache.get(1);
      cache.put(3, 'three');

      expect(cache.get(1), 'one');
      expect(cache.get(2), null);
      expect(cache.get(3), 'three');
    });

    test('Should remove item', () {
      final cache = LRUCache<int, String>(2);
      cache.put(1, 'one');
      cache.put(2, 'two');
      cache.remove(1);
      expect(cache.get(1), null);
      expect(cache.get(2), 'two');
    });

    test('Should clear all items', () {
      final cache = LRUCache<int, String>(2);
      cache.put(1, 'one');
      cache.put(2, 'two');
      cache.clear();
      expect(cache.get(1), null);
      expect(cache.get(2), null);
    });
  });
}
