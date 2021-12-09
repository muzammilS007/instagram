
import 'package:flutter/material.dart';
import 'package:instagram/data/model/feedmodels/feed_model.dart';
import 'package:instagram/utils/populating_feed_data.dart';

class HomeScreenViewModel with ChangeNotifier , SetupsFeeds {
  Feeds _feeds = Feeds();

  void initialize() {
    SetupsFeeds setupsFeeds = HomeScreenViewModel();
    setupsFeeds.populateFeeddata(_feeds);
  }

  Feeds getFeed(){
    return _feeds;
  }


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




}