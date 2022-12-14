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
