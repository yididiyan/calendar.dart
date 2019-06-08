import 'package:calendar/calendar.dart';


void main() {
  var calendar = new Calendar(
    weekStartDay: 7 // Sunday as start of week
  );


  final now = DateTime.now();
  final future = now.add(Duration(days: 75));
  print(calendar.customDatesCalendar(now, future));
  print(calendar.monthDatesCalendar(2019, 6, day: 8));
}