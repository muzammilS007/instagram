import 'package:flutter/material.dart';
import 'package:instagram/utils/image_file.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

class PostViewModel with ChangeNotifier {
  List<String> imageList = [];
  List<Asset> images = <Asset>[];
  var imagPath = "";

  setImagePath(int index) {
    imagPath = imageList[index];
    notifyListeners();
  }

  getImagePath(){
    return imagPath;
  }

  void setImageList() {
    getTenImagesPath().then((value) => {
          value.forEach((element) {
            print("images : ${element}");

            imageList.add(element);
          }),
        });
    notifyListeners();
  }

  Future<List<Asset>> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      return resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
          doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
      return resultList;
    }
  }
}
