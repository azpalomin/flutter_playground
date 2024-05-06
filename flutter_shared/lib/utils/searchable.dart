import 'dart:math';

import 'package:collection/collection.dart';
import 'package:string_similarity/string_similarity.dart';

class Searchable<T> {
  final T value;
  late final Map<String, double> _keyToWeights;

  Searchable({
    required this.value,
    List<String>? keys,
    Map<String, double>? keyToWeights,
  }) {
    assert(keys != null || keyToWeights != null, 'Either keys or keyToWeights must be provided');
    _keyToWeights = keyToWeights ?? {for (var item in keys!) item: 1};
  }

  final Map<String, double> _cache = {};
  final Map<String, double> _containsCache = {};
  final Map<String, double> _matchCache = {};

  int alphabeticallyCompare(Searchable<T> other) {
    if (_keyToWeights.keys.isNotEmpty && other._keyToWeights.keys.isNotEmpty) {
      return _keyToWeights.keys.first.compareTo(other._keyToWeights.keys.first);
    } else {
      return other._keyToWeights.length.compareTo(_keyToWeights.length);
    }
  }

  static List<Searchable<T>> alphabeticalSort<T>({
    required List<Searchable<T>> items,
    int? limit,
  }) {
    items.sort((a, b) => a.alphabeticallyCompare(b));
    return items.take(limit ?? items.length).toList();
  }

  // Max first
  int compareSearch(Searchable<T> other, String search) {
    if (_score(search) == other._score(search)) {
      return alphabeticallyCompare(other);
    } else {
      return other._score(search).compareTo(
            _score(search),
          );
    }
  }

  static List<T>? nullableSearchableItems<T>(List<Searchable<T>>? items) {
    if (items == null) return null;
    return searchableItems(items);
  }

  static List<Searchable<T>>? nullableSearchSort<T>({
    required List<Searchable<T>>? items,
    int? limit,
    required String? searchString,
    bool keepAll = false,
  }) {
    if (items == null) return null;

    return searchSort(
      items: items,
      searchString: searchString,
      limit: limit,
      keepAll: keepAll,
    );
  }

  static List<T> searchableItems<T>(List<Searchable<T>> items) {
    return items.map((item) => item.value).toList();
  }

  static List<Searchable<T>> searchSort<T>({
    required List<Searchable<T>> items,
    int? limit,
    required String? searchString,
    bool keepAll = false,
  }) {
    String search = (searchString ?? '').toLowerCase();
    if (items.isEmpty) return [];
    if (search.isEmpty) {
      if (keepAll || limit != null) {
        return alphabeticalSort(
          items: items,
          limit: limit,
        ).toList();
      }
      return [];
    }

    List<Searchable<T>> sorted = items.toList();

    sorted.sort((a, b) => a.compareSearch(b, search));
    sorted.removeWhere((e) => e._score(search) < 0.6);
    return sorted.take(limit ?? sorted.length).toList();
  }

  double _containsScore(String search) {
    if (_containsCache.containsKey(search)) return _containsCache[search]!;
    double maxValue = 0;
    String lowerCase = search.toLowerCase();

    for (String key in _keyToWeights.keys) {
      int index = key.indexOf(search);
      if (index >= 0) {
        maxValue = max(
          _keyToWeights[key]! * (1 - (index / (key.length * 2))),
          maxValue,
        );
      } else {
        index = key.toLowerCase().indexOf(lowerCase);
        if (index >= 0) {
          maxValue = max(
            _keyToWeights[key]! * (1 - (index / (key.length * 2))),
            maxValue,
          );
        }
      }
    }
    _containsCache[search] = maxValue * 2;
    return _containsCache[search]!;
  }

  double _fuzzyScore(String search) {
    if (_cache.containsKey(search)) return _cache[search]!;
    double maxValue = 0;
    String lowerCase = search.toLowerCase();

    for (String key in _keyToWeights.keys) {
      List<double> weights = [
        key.similarityTo(search) * _keyToWeights[key]!,
        key.toLowerCase().similarityTo(lowerCase) * _keyToWeights[key]!,
        maxValue
      ];
      maxValue = weights.max;
    }
    _cache[search] = maxValue;
    return _cache[search]!;
  }

  double _matchScore(String search) {
    if (_matchCache.containsKey(search)) return _matchCache[search]!;
    double maxValue = 0;
    String lowerCase = search.toLowerCase();

    for (String key in _keyToWeights.keys) {
      bool starts = key.startsWith(search);
      if (starts) {
        maxValue = max(_keyToWeights[key]!, maxValue);
      } else {
        starts = key.toLowerCase().startsWith(lowerCase);

        if (starts) {
          maxValue = max(_keyToWeights[key]!, maxValue);
        }
      }
    }
    _matchCache[search] = maxValue * 3;
    return _matchCache[search]!;
  }

  double _score(String search) {
    if (_matchCache.containsKey(search) && _containsCache.containsKey(search) && _cache.containsKey(search)) {
      return [
        for (double value in [_matchCache[search]!, _containsCache[search]!, _cache[search]!]) value
      ].max;
    }
    return [_matchScore(search), _containsScore(search), _fuzzyScore(search)].max;
  }
}
