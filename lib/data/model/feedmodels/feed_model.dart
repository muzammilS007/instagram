 import 'package:instagram/callbacks/feed_footer/feed_footer_callbacks.dart';
import 'package:instagram/data/model/feedmodels/feed_body_model.dart';
import 'package:instagram/data/model/feedmodels/feed_header_model.dart';

import 'feed_info_model.dart';

class Feeds{

  FeedHeaderModel? feedHeaderModel;
  FeedFooterCallBacks? feedFooterCallBacks;
  FeedBody? feedBody;
  FeedInfo? feedInfo;
  Feeds({this.feedHeaderModel,this.feedBody,this.feedFooterCallBacks,this.feedInfo});


}