import 'package:local_image_provider/device_image.dart';
import 'package:local_image_provider/local_image_provider.dart' as lip;

lip.LocalImageProvider imageProvider = lip.LocalImageProvider();

Future<List<dynamic>> getLatestImages() async {
  bool hasPermission = await imageProvider.initialize();
  if (hasPermission) {
    var images = await imageProvider.findLatest(10);
    return images;
/*    images.forEach((image) => {
      print(image.mediaType)
    });*/
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
