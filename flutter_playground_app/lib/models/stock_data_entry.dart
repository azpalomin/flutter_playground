class StockDataEntry {
  final DateTime date;
  final double open;
  final double high;
  final double low;
  final double close;
  final double closeAdj;
  final int volume;

  StockDataEntry({
    required this.date,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.closeAdj,
    required this.volume,
  });

  static StockDataEntry fromList(List<dynamic> list) {
    return StockDataEntry(
      date: DateTime.parse(list[0]),
      open: list[1],
      high: list[2],
      low: list[3],
      close: list[4],
      closeAdj: list[5],
      volume: list[6],
    );
  }
}
