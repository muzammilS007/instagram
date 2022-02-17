
import 'dart:io';

import 'package:flutter/material.dart';

import 'write_caption_widget.dart';

class SettingPostScreen extends StatelessWidget {

  SettingPostScreen({this.imagePath});
  final String? imagePath ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
        actions: [
          ElevatedButton(
              onPressed: (){
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Share', style: Theme.of(context).primaryTextTheme.subtitle1?.copyWith(
                  color: Colors.blue
              ),))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WriteCaptionWidget(),
            Divider(height: 1,),
            ListTile(
              title: Text('Tag People'),
              dense: true,
            ),
            Divider(height: 1,),

              ListTile(
                title: Text('Add Location'),
                dense: true,),
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Theme.of(context).toggleableActiveColor,
                    BlendMode.srcATop),
                child: ListTile(
                  title: Text(''),
                  leading: Icon(Icons.pin_drop),
                  trailing: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {

                      }),
                  dense: true,),
              ),
            Divider(height: 1,),


          Image(image: FileImage(File(imagePath!)))
    /*        SwitchListTile(
              value: false,
              onChanged: (value) {

              },
              title: Text('Facebook'),
            ),
            SwitchListTile(
              value: false,
              onChanged: (value) {
              },
              title: Text('Twitter'),
            ),
            SwitchListTile(
              value: false,
              onChanged: (value) {
              },
              title: Text('Tumblr'),
            ),*/
          ],
        ),
      ),
    );
  }
}
