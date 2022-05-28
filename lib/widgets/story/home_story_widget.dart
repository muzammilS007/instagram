import 'package:flutter/material.dart';

import 'story_item_widget.dart';

class HomeStoryWidget extends StatefulWidget {
  static const ROUTE_NAME = 'HomeStoryWidget';
  @override
  _HomeStoryWidgetState createState() => _HomeStoryWidgetState();
}

class _HomeStoryWidgetState extends State<HomeStoryWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 96,
        color: Theme.of(context).cardColor,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => StoryItemWidget(),
            separatorBuilder: (context, index) => SizedBox(width: 8, height: 0,),
            itemCount: 10,
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16
            ),
          physics: BouncingScrollPhysics(),
        )
      ),
    );
  }
}
