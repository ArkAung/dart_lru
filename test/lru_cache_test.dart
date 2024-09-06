import 'package:simple_lru_cache/simple_lru_cache.dart';
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

    test('Should evict the least recently used item', () {
      final cache = LRUCache<int, String>(2);
      cache.put(1, 'one');
      cache.put(2, 'two');
      cache.put(3, 'three');

      expect(() => cache.get(1), throwsA(isA<ArgumentError>()));
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
      expect(() => cache.get(2), throwsA(isA<ArgumentError>()));
      expect(cache.get(3), 'three');
    });

    test('Should remove item', () {
      final cache = LRUCache<int, String>(2);
      cache.put(1, 'one');
      cache.put(2, 'two');
      cache.remove(1);
      expect(() => cache.get(1), throwsA(isA<ArgumentError>()));
      expect(cache.get(2), 'two');
    });

    test('Should clear all items', () {
      final cache = LRUCache<int, String>(2);
      cache.put(1, 'one');
      cache.put(2, 'two');
      cache.clear();
      expect(() => cache.get(1), throwsA(isA<ArgumentError>()));
      expect(() => cache.get(2), throwsA(isA<ArgumentError>()));
    });

    test('Should get all the keys of the cache', () {
      final cache = LRUCache<int, String>(3);
      final Map<int, String> cacheItems = { 1: 'one', 2: 'two', 3: 'three'};
      cache.addAll(cacheItems);
      expect(cache.keys(), [1 , 2, 3]);
    });

     test('Should add all items', () {
      final cache = LRUCache<int, String>(3);
      final Map<int, String> cacheItems = { 1: 'one', 2: 'two', 3: 'three'};
      cache.addAll(cacheItems);
      expect(cache.get(1), 'one');
      expect(cache.get(2), 'two');
      expect(cache.get(3), 'three');
    });
  });
}
