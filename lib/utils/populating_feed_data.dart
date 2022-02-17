import 'package:instagram/callbacks/feed_footer/feed_footer_callbacks.dart';
import 'package:instagram/data/model/feedmodels/feed_body_model.dart';
import 'package:instagram/data/model/feedmodels/feed_header_model.dart';
import 'package:instagram/data/model/feedmodels/feed_info_model.dart';
import 'package:instagram/data/model/feedmodels/feed_model.dart';

import 'constants.dart';

abstract class SetupsFeeds {
  Feeds populateFeeddata(Feeds feeds) {
    feeds.feedHeaderModel = FeedHeaderModel(
        profileImagePath: Constants.avatar,
        postOwnerName: "Muzammil Zafar",
        postLocation: "Islamabad pakistan");
    feeds.feedBody = FeedBody(bodyimagepath: 'assets/sample/search_demo1.jpg');
    feeds.feedInfo = FeedInfo(
        noOfLikes: "1200",
        feedInfoTitle: "Mex Weel",
        feedInfoDetail:
            "helloo this is may first insta post and im so much exited about this",
        noOfComment: "4");
    feeds.feedFooterCallBacks = FeedFooterCallBacks(
        isFvtClicked: () => {fvtClicked()},
        isBookmarkClicked: () => {bookmarkClicked()},
        isCommentClicked: () => {commentClicked()},
        isSendClicked: () => {sendClicked()});

    return feeds;
  }

  void fvtClicked() {}

  void bookmarkClicked() {}

  void commentClicked() {}

  void sendClicked() {}
}
