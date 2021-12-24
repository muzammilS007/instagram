import 'package:flutter/material.dart';

import 'package:instagram/data/model/feedmodels/feed_body_model.dart';

class BodyWidget extends StatelessWidget {
  final FeedBody feedBody;
  BodyWidget({this.feedBody});


  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      //'assets/sample/search_demo1.jpg'
      aspectRatio: 1,
      child: Image.asset(
        '${feedBody.bodyimagepath}',
        fit: BoxFit.cover,
      ),
    );
  }
}
