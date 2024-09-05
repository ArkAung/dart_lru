# LRU Cache

A simple Least Recently Used (LRU) cache implementation in Dart.

## Usage

```dart
import 'package:lru_cache/lru_cache.dart';

void main() {
    final cache - LRUCache<int, String>(2);
    cache.put(1, 'one');
    cache.put(2, 'two');
    print(cache.get(1)); // one
    print(cache.put(3, 'three'));
    print(cache.get(2)); // null
}
```