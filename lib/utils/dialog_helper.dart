import 'package:flutter/material.dart';
import 'package:instagram/ui/camera/camera_screen.dart';
import 'package:instagram/utils/navegation_helper.dart';
import 'package:photo_view/photo_view.dart';

import 'image_text_wedget.dart';

Widget showOverlayImage(String path) {
  return Dialog(
    backgroundColor: Colors.black,

//"assets/sample/search_demo1.jpg"
    child: Card(
      elevation: 8,
      child: PhotoView(
        imageProvider: AssetImage(path),
      ),
    ),
  );
}

Widget buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    content: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset(
        "assets/sample/search_demo1.jpg",
        fit: BoxFit.fill,
      ),
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}

Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Info'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('This feature not supported in Ios Platform'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> imagePickerDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Pick Image from'),
                  ),
                  Row(
                    children: [

                      Expanded(
                        flex: 1,
                        child: Icon(Icons.camera).imageWithText("Camera",()=>{
                          context.pushNavigation(CameraScreen())
                        }),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(Icons.add_photo_alternate_outlined).imageWithText("Gallery",()=>{}),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
