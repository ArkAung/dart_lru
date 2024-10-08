# Simple LRU Cache

[![Pub Version](https://img.shields.io/pub/v/simple_lru_cache)](https://pub.dev/packages/simple_lru_cache)
[![Dart SDK Version](https://badgen.net/pub/sdk-version/simple_lru_cache)](https://pub.dev/packages/simple_lru_cache)
[![codecov](https://codecov.io/gh/arkaung/dart_lru/branch/main/graph/badge.svg)](https://codecov.io/gh/arkaung/dart_lru)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Pub Points](https://img.shields.io/pub/points/simple_lru_cache)](https://pub.dev/packages/simple_lru_cache/score)

A simple and efficient Least Recently Used (LRU) cache implementation in Dart.

## Features

- Fixed-size cache with LRU eviction policy
- Generic key-value storage
- O(1) complexity for get, put, and remove operations

## Usage

```dart
import 'package:simple_lru_cache/simple_lru_cache.dart';

void main() {
  final cache = LRUCache<int, String>(3);
  
  cache.put(1, 'one');
  cache.put(2, 'two');
  cache.put(3, 'three');
  
  print(cache.get(1));  // Outputs: one
  
  cache.put(4, 'four'); // This will evict the least recently used item (2)
  
  print(cache.containsKey(2)); // Outputs: false
}
```

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  simple_lru_cache: ^0.2.1
```

Then run `dart pub get`.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.