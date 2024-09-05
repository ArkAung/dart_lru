# Changelog

## [0.2.1] - 2024-09-05

### Updated
- Run dart format to ensure perfect pub score

## [0.2.0] - 2024-09-05

### Updated
- Throws an exception if the key is not present in the cache rather than returning null

## [0.1.0] - 2024-09-05

### Added
- Initial release of the LRU Cache package.
  - `LRUCache` class implementation.
  - Basic methods for cache management: `put`, `get`, `remove`, and `clear`.
  - Automatic eviction of least recently used items to manage memory efficiently.