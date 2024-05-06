import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playground/models/stock_data_entry.dart';

class StockDataService {
  // Simulating calling to the server
  static Future<List<StockDataEntry>> getData({
    int? offset,
    int? page,
    required int limit,
  }) async {
    assert((offset == null || page == null) && (offset != null || page != null));
    await Future.delayed(const Duration(milliseconds: 500));
    String result = await rootBundle.loadString('AAPL.csv');
    List<List<dynamic>> fields = const CsvToListConverter().convert(result, eol: '\n');
    int off = (offset ?? page! * limit) + 1;
    int end = off + limit;
    List<List<dynamic>> subset = fields.sublist(off, end > fields.length ? fields.length : end);
    return subset.map((l) => StockDataEntry.fromList(l)).toList();
  }
}
