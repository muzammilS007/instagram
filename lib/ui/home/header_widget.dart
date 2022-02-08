import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:developer' as developer;

import 'package:instagram/res/icons_app.dart';
import 'package:instagram/ui/chat/chat_history_screen.dart';
import 'package:instagram/ui/chat/chat_screen.dart';
import 'package:instagram/utils/navegation_helper.dart';


class HeaderWidget extends StatelessWidget with PreferredSizeWidget {
 // final VoidCallback onCameraClick;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      elevation: 2,
      child: SafeArea(
        child: Container(
          child: Row(
            children: <Widget>[
              IconButton(icon: SvgPicture.asset(IconsApp.icCamera,
                color: Theme.of(context).colorScheme.onPrimary,), onPressed: ()=>{}),
              Expanded(child: Container(
                child: SvgPicture.asset(IconsApp.logoInsta,
                  color: Theme.of(context).colorScheme.onPrimary,),
              )),
              IconButton(icon: SvgPicture.asset(IconsApp.icSend,
                color: Theme.of(context).colorScheme.onPrimary,), onPressed: (){
                ChatSettingScreen().pushNavigation(context);
              })
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48);
}
