import 'package:flutter/material.dart';
import 'package:instagram/utils/image_file.dart';

class PostViewModel with ChangeNotifier{

  var imageList =[];

  void setImageList()
  {
    getLatestImages().then((value) => {
      value.forEach((element) {
        imageList.add(element);
      }),

      notifyListeners()
    });
  }

}