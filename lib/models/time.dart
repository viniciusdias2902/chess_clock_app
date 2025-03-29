class Time {
  Time({required this.hours, required this.minutes, required this.seconds});
  int hours;
  int minutes;
  int seconds;
  @override
  String toString() {
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
