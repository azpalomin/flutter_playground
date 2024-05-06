import 'dart:math' as math;

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playground/models/stock_data_entry.dart';

class StockDataService {
  static Future<List<StockDataEntry>> getData({
    int? offset,
    int? page,
    required int limit,
  }) async {
    assert((offset == null || page == null) && (offset != null || page != null));
    // Simulating calling to the server
    await Future.delayed(const Duration(milliseconds: 500));

    // Simulate an error
    int random = math.Random().nextInt(11);
    if (random == 0) throw Exception();

    // Simulate end of data
    if (offset == 500) {
      return [];
    }

    String result = await rootBundle.loadString('AAPL.csv');
    List<List<dynamic>> fields = const CsvToListConverter().convert(result, eol: '\n');
    int off = (offset ?? page! * limit) + 1;
    int end = off + limit;
    List<List<dynamic>> subset = fields.sublist(off, end > fields.length ? fields.length : end);
    return subset.map((l) => StockDataEntry.fromList(l)).toList();
  }
}
