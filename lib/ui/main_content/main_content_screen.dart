import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/ui/home/home_screen.dart';
import 'package:instagram/ui/search/search_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainContent extends StatelessWidget {
  const MainContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainContentScreen();
  }
}

class MainContentScreen extends StatefulWidget {
  const MainContentScreen({Key key}) : super(key: key);

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      SearchScreen(),
      SearchScreen(),
      SearchScreen(),
      SearchScreen(),
    ];
  }

  @override
  _MainContentScreenState createState() => _MainContentScreenState();
}

class _MainContentScreenState extends State<MainContentScreen> {
  int index = 0;


  @override
  void initState() {
/*    setState(() {
      index=0;
    });*/
  }

  void onTap(int index) {
    setState(() {
      this.index = index;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
        backgroundColor: Colors.black,
        title: Text(
          "Instagram",
          style: TextStyle(
              fontFamily: 'DancingScript',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.add_comment))
        ],
      ),
      body: widget._buildScreens()[index],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => {onTap(0)},
                    iconSize: 30,
                    icon: Icon(
                      Icons.home,
                      color: index==0 ? Colors.blue : Colors.black,
                    ),
                  ),
                  Visibility(
                    visible: index==0 ? true : false,
                    child: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => {onTap(1)},
                    iconSize: 30,
                    icon: Icon(
                      Icons.search,
                      color: index==1 ? Colors.blue : Colors.black,
                    ),
                  ),
                  Visibility(
                    visible: index==1 ? true : false,
                    child: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => {onTap(2)},
                    iconSize: 30,
                    icon: Icon(
                      Icons.add_box,
                      color: index==2 ? Colors.blue : Colors.black,
                    ),
                  ),
                  Visibility(
                    visible: index==2 ? true : false,
                    child: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => {onTap(3)},
                    iconSize: 30,
                    icon: Icon(
                      Icons.favorite,
                      color: index==3 ? Colors.blue : Colors.black,
                    ),
                  ),
                  Visibility(
                    visible: index==3 ? true : false,
                    child: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => {onTap(4)},
                    iconSize: 30,
                    icon: Icon(
                      Icons.person,
                      color: index==4 ? Colors.blue : Colors.black,
                    ),
                  ),
                  Visibility(
                    visible: index==4 ? true : false,
                    child: Container(
                      height: 2,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
