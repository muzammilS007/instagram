import 'package:flutter/services.dart';
import 'package:stacked/stacked_annotations.dart';

@Singleton()
class Constants {

  static Constants? _instance;

  Constants._internal();
  factory Constants() => _instance ??= Constants._internal();

  //Method channel
  static final platform = const MethodChannel("test_activity");


  static final String appName = "Instagram";
  static final String defaultAvatarPlaceholder = 'assets/sample/ic_avatar_1.jpg';
  static final double avatarHeightDefault = 80;
  static final double avatarWidthDefault = 80;
  // in Sign Up Screen
  static final String labelEmail="email or username";
  static final String labelPassword="Password";
  static final String labelConfirmPassword="Confirm Password";
  static final String labelName="Name";
  static final String labelLocation="Location";

  //chat Recipient
  static var sender = 0;
  static var receiver = 1;

  //default avatar
  static var avatar = "assets/sample/ic_avatar_1.jpg";
}
