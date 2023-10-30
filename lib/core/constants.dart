import 'dart:math';

String getTimeAgo(int timestamp) {
  DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(timestamp);
  DateTime now = DateTime.now();

  int differenceInSeconds = max(0, now.difference(dateTime).inSeconds);
  if (differenceInSeconds < 60) {
    return "$differenceInSeconds seconds ago";
  } else {
    int differenceInMinute = differenceInSeconds ~/ 60;
    if (differenceInMinute < 60) {
      return "$differenceInMinute Minute ago";
    } else {
      int differenceInHours = differenceInMinute ~/ 60;
      if (differenceInHours < 60) {
        return "$differenceInHours Hours ago";
      } else {
        int differenceInDays = differenceInHours ~/ 60;

        return "$differenceInDays Days ago";
      }
    }
  }
}
