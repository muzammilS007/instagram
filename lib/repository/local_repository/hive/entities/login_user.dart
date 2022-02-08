
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class LoginUser {
  LoginUser({required this.userId, required this.userName, required this.userProfile});

  @HiveField(0)
  String userId;

  @HiveField(1)
  int userName;

  @HiveField(2)
  String userProfile;

}