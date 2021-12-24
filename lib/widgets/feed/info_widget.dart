
import 'package:flutter/material.dart';
import 'package:instagram/data/model/feedmodels/feed_info_model.dart';


class InfoWidget extends StatelessWidget {
  final FeedInfo feedInfo;

  InfoWidget({this.feedInfo});

  @override
  Widget build(BuildContext context) {

    final onOpenComment = () {
/*      Navigator.pushNamed(
          context,
          CommentPage.ROUTE_NAME,
          arguments: '112034');*/
    };

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DefaultTextStyle(
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                fontWeight: FontWeight.w800
              ),
              child: Text('${feedInfo.noOfLikes} likes', style: Theme.of(context).textTheme.bodyText2,)),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 8,
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: '${feedInfo.feedInfoTitle}', style: Theme.of(context).textTheme.bodyText2),
                  TextSpan(text: '${feedInfo.feedInfoDetail}',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.w400
                      )),
                ]
              ),
            ),
          ),
          InkWell(
            child: Container(
              child: Text(
                'View all ${feedInfo.noOfComment} comment',
                style: Theme.of(context).textTheme.caption,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 4
              ),
            ),
            onTap: onOpenComment,
          )
        ],
      ),
    );
  }
}
