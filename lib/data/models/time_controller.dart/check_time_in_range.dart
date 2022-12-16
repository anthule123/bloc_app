class HourMinute {
  int hour;
  int minute;
  HourMinute(
    this.hour,
    this.minute,
  );
  @override
  String toString() {
    return '$hour:$minute';
  }

  @override
  bool operator <(HourMinute other) {
    // compare this to other
    return hour < other.hour ||
     (hour == other.hour && minute < other.minute);
  }
}

HourMinute simple(String hm) {
  dynamic b = hm.split(':');
  return HourMinute(int.parse(b[0]), int.parse(b[1]));
}

class Range {
  HourMinute start;
  HourMinute end;
  Range(
    this.start,
    this.end,
  );
  @override
  String toString() {
    return '$start --> $end';
  }
}

bool inRange(DateTime t, Range r) {
  int year = t.year;
  int month = t.month;
  int day = t.day;
  DateTime start = DateTime(year, month, day, r.start.hour, r.start.minute);
  DateTime end = DateTime(year, month, day, r.end.hour, r.end.minute);
  return start.isBefore(t) && t.isBefore(end);
}

bool inRangeToday(DateTime t, Range r) {
  DateTime today = DateTime.now();
  bool sameYear = t.year == today.year;
  bool sameMonth = t.month == today.month;

  bool sameDay = t.day == today.day;
  return sameDay && sameMonth && sameYear && inRange(t, r);
}
