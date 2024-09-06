import 'dart:collection';

/// A [LRUCache] is a cache that evicts the least recently used items when it reaches its capacity
class LRUCache<K, V> {
  final int _capacity;
  final LinkedHashMap<K, V> _cache;

  /// Creates a new [LRUCache] with the given [capacity]
  LRUCache(this._capacity) : _cache = LinkedHashMap<K, V>();

  /// Retrieves the [value] associated with [key]
  /// Throws an exception if the [key] is not present in the cache
  V get(K key) {
    final value = _cache[key];
    if (value == null) {
      throw ArgumentError('No value found for key: $key');
    }

    // Move the accessed entry to the end (most recently used)
    _cache.remove(key);
    _cache[key] = value;
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

  /// Clears all entries in the cache
  void clear() {
    _cache.clear();
  }

  /// Returns a [List] of keys present in the cache
  Iterable<K> keys() => _cache.keys;

  /// Add all [entries] to the cache
  void addAll(Map<K, V> entries) {
    if (entries.length > _capacity) {
      throw ArgumentError('Cannot add more than capacity: $_capacity');
    }
    entries.forEach((key, value) => put(key, value));
  }

  @override
  String toString() => _cache.toString();
}
