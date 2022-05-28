import 'package:dio/dio.dart';
import 'package:instagram/utils/end_points.dart';
import 'package:retrofit/http.dart';

import 'models/prayer_times.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://api.aladhan.com/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(EndPoints.GET_PRAYER_TIME)
  Future<PrayerTimes> getTasks(
  { @Query("latitude")  double latitude=33.6844,
    @Query("longitude") double longitude=73.0479,
    @Query("method") int method=2,
    @Query("month") int month=5,
    @Query("year") int year=2022}
  );
}
