import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instagram/ui/islam/api_client.dart';
import 'package:instagram/ui/islam/models/prayer_times.dart';
import 'package:instagram/ui/islam/models/prayers_list.dart';
import 'package:instagram/utils/extensions.dart';
import 'package:intl/intl.dart';

import '../../utils/time_helper.dart';

class PrayerTimeViewmodel with ChangeNotifier{
  var prayertime ;
  List prayerlist=[];

   populatePrayerTimes(){
     var dio = Dio();
     var apiclient = RestClient(dio);
     apiclient.getTasks().then((value) => {
     prayertime =  value,
       getSpecificPrayerTime(),
         notifyListeners()
     });


   }

   getSpecificPrayerTime(){

     var data =  (prayertime as PrayerTimes).data;
     var currentDate = getDay();
     data?.forEach((element) {

       if(currentDate==element.date?.gregorian?.day) {

         var json = element.timings?.toJson();
         json?.forEach((key, value) {
           var amPmTimeFormate = utcTo12HourFormat((value as String).replaceExtra());
           prayerlist.add(PrayerList(key, amPmTimeFormate));
          // print(key + getTime(amPmTimeFormate,key).toString());

        });
         print(element.timings?.fajr);
         print(element.timings?.dhuhr);
         print(element.timings?.asr);
         print(element.timings?.maghrib);
         print(element.timings?.isha);
         notifyListeners();
         return;
       }
     });
   }

    commingUpNamaz(String namazTime){
     var currentTime = TimeOfDay.fromDateTime(DateTime.now());
      TimeOfDay _startTime = TimeOfDay(hour:int.parse(namazTime.split(":")[0]),minute: int.parse(namazTime.split(":")[1]));
      return currentTime.compareTo(_startTime);
   }

/*  getTime() {
     prayerlist.forEach((element) {
       DateTime endTimeDate = new DateFormat("hh:mm aa").parse((element as PrayerList)!.PrayerTime!);
       bool result = false;
       int startTimeInt = (DateTime.now().hour * 60 + DateTime.now().minute) * 60;
       int EndTimeInt = (endTimeDate.hour * 60 + endTimeDate.minute) * 60;
       int dif = EndTimeInt - startTimeInt;

       if (EndTimeInt > startTimeInt) {
         result = true;
       } else {
         result = false;
       }
     });
    DateTime endTimeDate = new DateFormat("hh:mm aa").parse(endTime);
     bool result = false;
    int startTimeInt = (DateTime.now().hour * 60 + DateTime.now().minute) * 60;
    int EndTimeInt = (endTimeDate.hour * 60 + endTimeDate.minute) * 60;
    int dif = EndTimeInt - startTimeInt;

    if (EndTimeInt > startTimeInt) {
      result = true;
    } else {
      result = false;
    }
    return result;
  }*/
}