class DateTimeUtil {
  static String getShortName(int index) {
    return shortMonths[index];
  }

  static String getName(int index) {
    return months[index];
  }

  static List<String> get shortMonths => [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];

  static List<String> get months => [
        'Jan',
        'Feb',
        'March',
        'April',
        'May',
        'June',
        'July',
        'Aug',
        'Sept',
        'Oct',
        'Nov',
        'Dec',
      ];
}
