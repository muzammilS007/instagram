import 'dart:io';

import 'package:hive/hive.dart';
import 'package:instagram/repository/local_repository/hive/entities/login_user.dart';

class DbOperation{
  var path = Directory.current.path;
  var box;
  init() async{
   box  = await Hive.openBox('testBox');
  }




}