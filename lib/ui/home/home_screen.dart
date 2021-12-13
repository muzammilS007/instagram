import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/callbacks/feed_footer/feed_footer_callbacks.dart';
import 'package:instagram/data/model/feedmodels/feed_body_model.dart';
import 'package:instagram/data/model/feedmodels/feed_header_model.dart';
import 'package:instagram/data/model/feedmodels/feed_info_model.dart';
import 'package:instagram/data/model/feedmodels/feed_model.dart';
import 'package:instagram/ui/home/home_screen_viewmodel.dart';
import 'package:instagram/utils/populating_feed_data.dart';
import 'package:instagram/widgets/feed/feed_widget.dart';
import 'package:instagram/widgets/story/home_story_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:stacked/stacked.dart';

import 'header_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
        viewModelBuilder: () => HomeScreenViewModel(),
        onModelReady: (viewModel) => viewModel.initialize(),
        builder: (context, viewmodel, child) {
          return Scaffold(
            appBar: HeaderWidget(),
            body: Container(
              child: Column(
                children: <Widget>[
                  HomeStoryWidget(),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return FeedWidget(
                          feeds: viewmodel.getFeed(),
                        );
                      }),
                ],
              ),
            ),
          );
        });
  }
}

/*class HomeScreen extends StatefulWidget {
  Feeds feeds = new Feeds();
  VoidCallback onCameraClick;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void fvtClicked() {
    print("fvt Clicked");
  }

  @override
  void bookmarkClicked() {
    print("bookmark Clicked");
  }

  @override
  void commentClicked() {
    print("comment Clicked");
  }

  @override
  void sendClicked() {
    print("send Clicked");
  }

  @override
  Widget build(BuildContext context) {
    SetupsFeeds setupsFeeds = _HomeScreenState();
    widget.feeds = setupsFeeds.populateFeeddata(widget.feeds);
*/ /*    feeds = Feeds();
    SetupsFeeds setupsFeeds=_HomeScreenState();
    feeds= setupsFeeds.populateFeeddata(widget.feeds);*/ /*
    */ /*
    feeds.feedHeaderModel=FeedHeaderModel(profileImagePath:'assets/sample/ic_avatar_1.jpg',postOwnerName: "Muzammil Zafar",postLocation: "Islamabad pakistan");
    feeds.feedBody = FeedBody(bodyimagepath: 'assets/sample/search_demo1.jpg');
    feeds.feedInfo=FeedInfo(noOfLikes: "1200",feedInfoTitle: "Mex Weel",feedInfoDetail: "helloo this is may first insta post and im so much exited about this",noOfComment: "4");
    feeds.feedFooterCallBacks=FeedFooterCallBacks(isFvtClicked: ()=>{fvtClicked()},isBookmarkClicked: ()=>{bookmarkClicked()},isCommentClicked: ()=>{commentClicked()},isSendClicked: ()=>{sendClicked()});

*/ /*
    return Scaffold(
      appBar: HeaderWidget(widget.onCameraClick),
      body: RefreshIndicator(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                HomeStoryWidget(),
                FeedWidget(
                  feeds: widget.feeds,
                ),
                FeedWidget(feeds: widget.feeds)
              ],
            ),
          ),
          onRefresh: () async {}),
    );
  }

  @override
  void initState() {


  }
}*/
