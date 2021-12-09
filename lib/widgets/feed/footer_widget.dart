import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/callbacks/feed_footer/feed_footer_callbacks.dart';
import 'dart:developer' as developer;

import 'package:instagram/res/icons_app.dart';


class FooterWidget extends StatelessWidget {

  final FeedFooterCallBacks feedFooterCallBacks;


  FooterWidget({@required this.feedFooterCallBacks});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          IconButton(icon: SvgPicture.asset(IconsApp.icFavorite,
            color: Colors.black), onPressed: (){
            feedFooterCallBacks.isFvtClicked();

          }),
          IconButton(
              icon: SvgPicture.asset(
                IconsApp.icComment,
                color: Colors.black,),
              onPressed: (){
                feedFooterCallBacks.isCommentClicked();


              }),
          IconButton(
              icon: SvgPicture.asset(
                IconsApp.icSend,
                color: Colors.black,),
              onPressed: (){
                feedFooterCallBacks.isSendClicked();

              }),
          Expanded(child: Align(
            alignment: Alignment.bottomRight,
            child: IconButton(icon: Icon(Icons.bookmark_border), onPressed: (){
              feedFooterCallBacks.isBookmarkClicked();

            }),
          ))
        ],
      ),
    );
  }
}
