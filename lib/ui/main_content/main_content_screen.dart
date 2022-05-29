import 'package:flutter/material.dart';
import 'package:instagram/ui/main_content/main_screen_viewmodel.dart';
import 'package:instagram/utils/permission_helper.dart';
import 'package:instagram/utils/themes.dart';
import 'package:stacked/stacked.dart';

class MyApp extends StatelessWidget {
//  final _sharePref = SharePref();

  @override
  Widget build(BuildContext context) {
    // _sharePref.initialize();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: kPrimaryColor,
          splashColor: kPrimaryColor,
        ),
        home: ViewModelBuilder<MainScreenViewModel>.reactive(
            viewModelBuilder: () => MainScreenViewModel(),
            builder: (cntx, viewmodel, child) {
              return Scaffold(
                body: viewmodel.buildScreens()[viewmodel.index],
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffe8e2e2),
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () => {viewmodel.onTap(0)},
                                iconSize: 30,
                                icon: Icon(
                                  Icons.home,
                                  color: viewmodel.index == 0
                                      ? Colors.blue
                                      : Colors.black,
                                ),
                              ),
                              Visibility(
                                visible: viewmodel.index == 0 ? true : false,
                                child: Divider(
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
                                onPressed: () => {viewmodel.onTap(1)},
                                iconSize: 30,
                                icon: Icon(
                                  Icons.search,
                                  color: viewmodel.index == 1
                                      ? Colors.blue
                                      : Colors.black,
                                ),
                              ),
                              Visibility(
                                visible: viewmodel.index == 1 ? true : false,
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
                                onPressed: () => {
                                  checkPermission(() => {viewmodel.onTap(2)}),
                                },
                                iconSize: 30,
                                icon: Icon(
                                  Icons.add_box,
                                  color: viewmodel.index == 2
                                      ? Colors.blue
                                      : Colors.black,
                                ),
                              ),
                              Visibility(
                                visible: viewmodel.index == 2 ? true : false,
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
                                onPressed: () => {viewmodel.onTap(3)},
                                iconSize: 30,
                                icon: Icon(
                                  Icons.favorite,
                                  color: viewmodel.index == 3
                                      ? Colors.blue
                                      : Colors.black,
                                ),
                              ),
                              Visibility(
                                visible: viewmodel.index == 3 ? true : false,
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
                                onPressed: () => {viewmodel.onTap(4)},
                                iconSize: 30,
                                icon: Icon(
                                  Icons.person,
                                  color: viewmodel.index == 4
                                      ? Colors.blue
                                      : Colors.black,
                                ),
                              ),
                              Visibility(
                                visible: viewmodel.index == 4 ? true : false,
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
                ),
              );
            }));
    /*return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          shadowColor: Colors.transparent,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.black),
        ),
        body: MainContent());*/
  }
}

/*
class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainContentScreen();
  }
}
*/

/*class MainContentScreen extends StatefulWidget {
  const MainContentScreen({Key? key}) : super(key: key);

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      SearchScreen(),
      PostScreen(),
      FollowingRequest(),
      AccountPage(),
    ];
  }

  @override
  _MainContentScreenState createState() => _MainContentScreenState();
}

class _MainContentScreenState extends State<MainContentScreen> {
  int index = 0;

  @override
  void initState() {
*/ /*    setState(() {
      index=0;
    });*/ /*
  }

  void onTap(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: widget._buildScreens()[index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: const Color(0xffe8e2e2),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20), right: Radius.circular(20))),
        child: Padding(
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
                        color: index == 0 ? Colors.blue : Colors.black,
                      ),
                    ),
                    Visibility(
                      visible: index == 0 ? true : false,
                      child: Divider(
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
                        color: index == 1 ? Colors.blue : Colors.black,
                      ),
                    ),
                    Visibility(
                      visible: index == 1 ? true : false,
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
                      onPressed: () =>
                      {
                        checkPermission(() => {
                        onTap(2)
                        }),

                      },
                      iconSize: 30,
                      icon: Icon(
                        Icons.add_box,
                        color: index == 2 ? Colors.blue : Colors.black,
                      ),
                    ),
                    Visibility(
                      visible: index == 2 ? true : false,
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
                        color: index == 3 ? Colors.blue : Colors.black,
                      ),
                    ),
                    Visibility(
                      visible: index == 3 ? true : false,
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
                        color: index == 4 ? Colors.blue : Colors.black,
                      ),
                    ),
                    Visibility(
                      visible: index == 4 ? true : false,
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
      ),
    );
  }
}*/
