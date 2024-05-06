enum DayOfTheWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  static DayOfTheWeek fromDateTime(DateTime day) => DayOfTheWeek.values.asMap()[day.weekday - 1]!;
  static DayOfTheWeek? fromInt(int dayOfTheWeek) => DayOfTheWeek.values.asMap()[dayOfTheWeek];
  static DayOfTheWeek? fromString(String str) => DayOfTheWeek.values.asNameMap()[str.trim().toLowerCase()];
  static int toInt(DayOfTheWeek dayOfTheWeek) => DayOfTheWeek.values.indexOf(dayOfTheWeek);
}

enum Direction {
  back,
  next,
  noMove,
}
