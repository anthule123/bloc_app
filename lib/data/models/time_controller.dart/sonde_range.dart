import 'check_time_in_range.dart';

List<Range> sondeRange = [
  Range(HourMinute(5, 30), HourMinute(6, 30)),
  Range(HourMinute(11, 30), HourMinute(12, 30)),
  Range(HourMinute(17, 30), HourMinute(18, 30)),
  Range(HourMinute(21, 30), HourMinute(22, 30)),
];

bool inSondeRange(DateTime t) {
  List<bool> b = [for (int i = 0; i < 4; i++) inRange(t, sondeRange[i])];
  var result = b.any((element) => element == true);
  return result;
}

bool inSondeRangeToday(DateTime t) {
  List<bool> b = [for (int i = 0; i < 4; i++) inRangeToday(t, sondeRange[i])];
  var result = b.any((element) => element == true);
  return result;
}

int? rangeContain(DateTime t) {
  for (int i = 0; i < 4; i++) {
    if (inRange(t, sondeRange[i])) {
      return i;
    }
  }
  return null;
}

int nextRange(DateTime t) {
  HourMinute hm = HourMinute(t.hour, t.minute);
  for (int i = 0; i < 4; i++) {
    if (hm < sondeRange[i].start) {
      return i;
    }
  }
  return 0;
}

String waitingMessage(DateTime t) {
  int index_next_range = nextRange(t);
  int h = sondeRange[index_next_range].start.hour;
  int m = sondeRange[index_next_range].start.minute;
  return 'Bạn phải đợi đến $h: $m cho lần đo tiếp theo.';
}
