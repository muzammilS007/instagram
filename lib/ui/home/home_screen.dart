import 'package:flutter/material.dart';
import 'package:instagram/ui/home/home_screen_viewmodel.dart';
import 'package:instagram/widgets/feed/feed_widget.dart';
import 'package:instagram/widgets/story/home_story_widget.dart';
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
            body: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return index==0 ? HomeStoryWidget(): FeedWidget(
                    feeds: viewmodel.getFeed(),
                  );
                }),
          );
        });
  }
}



