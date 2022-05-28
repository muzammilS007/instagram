/*
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:local_image_provider/device_image.dart';
import 'package:local_image_provider/local_image_provider.dart' as lip;
import 'package:storage_path/storage_path.dart';

import '../data/model/FileModel.dart';
import 'constants.dart';

lip.LocalImageProvider imageProvider = lip.LocalImageProvider();

Future<List<dynamic>> getLatestImages() async {
  bool hasPermission = await imageProvider.initialize();
  if (hasPermission) {
    var images = await imageProvider.findLatest(10);
    return images;
*/
/*    images.forEach((image) => {
      print(image.mediaType)
    });*//*

  } else {
    print("The user has denied access to images on their device.");
    return List.empty();
  }
}

getAllImages() async {
  bool hasPermission = await imageProvider.initialize();
  if (hasPermission) {
    var images = await imageProvider.findLatest(1);
    if (!images.isEmpty) {
      var image = images.first;
      DeviceImage deviceImg = DeviceImage(image);
      print(deviceImg.localImage.fileName);
    } else {
      print("No images found on the device.");
    }
  } else {
    print("The user has denied access to images on their device.");
  }
}

Future<List<FileModel>> getImagesPath() async{
  var imagePath = await StoragePath.imagesPath;
  var images = jsonDecode(imagePath) as List;
 var files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList()??List.empty();
  if(files.length > 0){
      return files;
  }
  return List.empty();
}

Future<List<String>> getTenImagesPath() async{
  List<String> tenimages=[];
  var imagePath = await StoragePath.imagesPath;
  var images = jsonDecode(imagePath) as List;
  print("images : ${images.toString()}");
 var files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList()??List.empty();
  files.forEach((element) {
    element.files.forEach((element) {

      if(tenimages.length<10) {
        tenimages.add(element);
      }

    });
  });
  return tenimages;
}

checkImageIsValid(String path){
  var imagefile = File(path);
  return File(path).existsSync() ? Image(image: FileImage(imagefile),fit: BoxFit.cover,) : Image(image: AssetImage(Constants.avatar),fit: BoxFit.cover,);
}
*/
