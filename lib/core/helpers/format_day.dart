String formatDayShort(String date) {
  DateTime dt = DateTime.parse(date);
  return ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][dt.weekday % 7];
}
String formatDay(String date) {
  DateTime dt = DateTime.parse(date);
  return ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'][dt.weekday % 7];
}
