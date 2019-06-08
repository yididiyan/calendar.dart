/// Inspired by :
/// * https://github.com/ramalho/calendar.js/
/// * And Python's calendar.py


class Calendar {
  
  int weekStartDay;
  
  Calendar({
    this.weekStartDay = 1 // Week start day default to 'Monday'
  });


  DateTime weekStartDate(DateTime date) {
    if(date.weekday == this.weekStartDay) return date;
    while(date.weekday != this.weekStartDay) {
      date = date.subtract(Duration(days: 1));
    }

    return date;
  }

  List generateWeekDates(DateTime startDate) {
    return new List.generate(7, (int index) => startDate.add(Duration(days: index)));
  }


  List monthDatesCalendar(int year, int month, {int day}) {
    
    if(year < 1) {
      throw new CalendarException('Not really a good year');
    }

    if(month > 12 || month < 1) {
      throw new CalendarException('Month has to be within range of 1 to 12');
    }
    
    var weeks = [];
    var startDate = weekStartDate(DateTime.utc(year, month, day ?? 1));

    while('${startDate.year}/${startDate.month}'.compareTo('${year}/${month}') != 1) {
      weeks.add(generateWeekDates(startDate));
      startDate = startDate.add(Duration(days: 7));
    }




    return weeks;
  }


  List yearDatesCalendar(int year) {
    if(year < 1) {
      throw new CalendarException('Not really a good year');
    }

    var months = [];

    final monthIndices = List.generate(12, (index) => index + 1);
    
    monthIndices.forEach((month) {
      months.add(monthDatesCalendar(year, month));
    });


    return months;
  }

  List customDatesCalendar(DateTime startDate, DateTime endDate) {

    if(endDate.isBefore(startDate)) {
      throw CalendarException('End date must be after start date.');
    }

    int numberOfMonths = (endDate.difference(startDate).inDays / 30).ceil(); // Approximate number of months 

    List months = [];
    var year = startDate.year;
    var month = startDate.month;

    

    for(int i = 0; i < numberOfMonths; i++) {
      months.add(monthDatesCalendar(year, month));
      year = (month % 12) == 0 ? year + 1 : year;
      month = month % 12 + 1;

    }
    

    return months;

  }

}



class CalendarException implements Exception{

  final String message;

  const CalendarException([this.message]);
  
  @override
  String toString() => 'CalendarException: $message' ?? 'Invalid time provided';
}


