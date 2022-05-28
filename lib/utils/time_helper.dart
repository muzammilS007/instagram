import 'package:get/get.dart';
import 'package:intl/intl.dart';

getCurrentTime() {
  return DateFormat.jm().format(DateTime.now());
}

//e.g like Monday , Tuesday , Wednesday ...
getDay() {
  var now = new DateTime.now();
  var formatter = new DateFormat('dd');
  String formattedDate = formatter.format(now);
  return formattedDate;
}

getDate(){
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(now);
  return formattedDate;
}

changeTimeFormate(String time)
{
  var dateFormat = DateFormat("hh:mm aa"); // you can change the format here
  String createdDate = dateFormat.format(DateTime.parse(time.removeAllWhitespace));
  return createdDate;
}

String utcTo12HourFormat(String bigTime) {
  DateTime tempDate = DateFormat("hh:mm").parse(bigTime);
  var dateFormat = DateFormat("h:mm a"); // you can change the format here
  var utcDate = dateFormat.format(tempDate); // pass the UTC time here
  var localDate = dateFormat.parse(utcDate, true).toUtc().toString();
  String createdDate = dateFormat.format(DateTime.parse(localDate));
  print("------------$createdDate");
  return createdDate;
}



