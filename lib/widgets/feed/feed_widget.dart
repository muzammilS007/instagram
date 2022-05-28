import 'package:flutter/material.dart';
import 'package:instagram/data/model/feedmodels/feed_model.dart';
import 'package:instagram/widgets/feed/body_widget.dart';

import 'footer_widget.dart';
import 'header_widget.dart';
import 'info_widget.dart';

class FeedWidget extends StatelessWidget {
  final Feeds? feeds;

  FeedWidget({this.feeds});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: Divider.createBorderSide(context)
          )
        ),
        padding: EdgeInsets.only(
            bottom: 8
        ),
        child: Column(

          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            HeaderWidget(feedHeaderModel:feeds!.feedHeaderModel!),
            BodyWidget(feedBody: feeds!.feedBody),
            FooterWidget(feedFooterCallBacks: feeds!.feedFooterCallBacks!,),
            InfoWidget(feedInfo: feeds!.feedInfo!,)
          ],
        ),
      ),
    );
  }
}
