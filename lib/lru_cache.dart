import 'dart:collection';

class LRUCache<K, V> {
  final int _capacity;
  final LinkedHashMap<K, V> _cache;

  /// Creates a new [LRUCache] with the given [capacity]
  LRUCache(this._capacity): _cache = LinkedHashMap<K, V>();

  V? get(K key) {
    if (!_cache.containsKey(key)) {
      return null;
    }

    // Move the accessed entry to the end (most recently used)
    final value = _cache.remove(key);
    _cache[key] = value!;
    return value;
  }

  /// Adds a [key] and [value] to the cache
void put(K key, V value) {
    if (_cache.containsKey(key)) {
      _cache.remove(key);
    } else if (_cache.length >= _capacity) {
      // Remove the least recently used entry (first entry in the map)
      _cache.remove(_cache.keys.first);
    }
    _cache[key] = value;
  }

  /// Removes the [key] from the cache
  void remove(K key) {
    _cache.remove(key);
  }

  void clear() {
    _cache.clear();
  }

  @override
  String toString() => _cache.toString();
}