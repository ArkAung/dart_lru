import 'package:simple_lru_cache/simple_lru_cache.dart';

void main() {
  // Create a cache with a capacity of 3 items.
  final cache = LRUCache<int, String>(3);

  // Add some items to the cache.
  cache.put(1, 'One');
  cache.put(2, 'Two');
  cache.put(3, 'Three');

  print(cache.get(1)); // Output: One

  // Adding another item will evict the least recently used item.
  cache.put(4, 'Four');

  print(cache.get(2)); // Exception thrown
}
