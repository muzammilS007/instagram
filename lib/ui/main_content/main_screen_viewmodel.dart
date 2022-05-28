import 'package:flutter/material.dart';

import '../account/account_page.dart';
import '../home/home_screen.dart';
import '../instagram_activities/following_request_screen.dart';
import '../post/post_screen.dart';
import '../search/search_screen.dart';

class MainScreenViewModel with ChangeNotifier{
  int index = 0;
  List<Widget> buildScreens() {
    return [
      HomeScreen(),
      SearchScreen(),
      PostScreen(),
      FollowingRequest(),
      AccountPage(),
    ];
  }
  void onTap(int index) {
      this.index = index;
      notifyListeners();

  }

}