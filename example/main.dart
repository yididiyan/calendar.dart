import 'package:dart_calendar/dart_calendar.dart';


void main() {
  // Sunday first calendar 
  final calendar = new Calendar(
    weekStartDay: 7 // Sunday as start of week
  );
  
  // Monday First Calendar
  final mondayFirstCalendar = new Calendar(
    weekStartDay: 1
  );
  
  // Calendar Month
  // Calendar for January, 2019
  print(calendar.monthDatesCalendar(2019, 1));
  
  // Calendar Year
  // Calendar for Year 1
  print(calendar.yearDatesCalendar(1));
  
  


  // Custom Calendar ranging from given start and end dates
  final now = DateTime.now();
  final future = now.add(Duration(days: 75));
  
  print(calendar.customDatesCalendar(now, future));
}
