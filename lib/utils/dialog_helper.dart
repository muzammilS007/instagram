import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

Widget showOverlayImage(String path){

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
      height : double.infinity,
      width: double.infinity,
      child: Image.asset("assets/sample/search_demo1.jpg", fit: BoxFit.fill,),
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