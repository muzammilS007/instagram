import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:instagram/ui/account/app_bar_account.dart';
import 'package:instagram/ui/islam/models/prayers_list.dart';
import 'package:instagram/ui/islam/prayer_time_viewmodel.dart';
import 'package:instagram/utils/toast_helper.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

import '../../utils/time_helper.dart';
import 'api_client.dart';

final logger = Logger();

class PrayerTimeScreen extends StatelessWidget {
  const PrayerTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return ViewModelBuilder<PrayerTimeViewmodel>.reactive(
        viewModelBuilder: () => PrayerTimeViewmodel(),
        onModelReady: (v) => {
              v.populatePrayerTimes(),
            },
        onDispose: (v) => {},
        builder: (cntx, viewmodel, child) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text("Prayer Time"),
              elevation: 0,
              centerTitle: true,
              leading: InkWell(
                onTap: () => {Navigator.pop(context)},
                child: Icon(Icons.arrow_back),
              ),
              actions: [
                InkWell(
                    onTap: () =>
                        {context.showToast("Function Implemented Later ")},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.settings),
                    )),
              ],
            ),
            body: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: queryData.size.height / 8,
                  child: Center(
                    child: Container(
                      height: queryData.size.height / 2,
                      child: Column(
                        children: [
                          Text(
                            "Zhur",
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                          Text("${getDay().toString()}",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: queryData.size.height / 2,
                      decoration: BoxDecoration(
                          color: const Color(0xfff6f6f6),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: ListView.separated(
                          itemBuilder: (cntx, index) {
                            return Container(
                              margin: EdgeInsets.all(8),
                              child: Row(children: [
                                Expanded(child: Text((viewmodel.prayerlist[index] as PrayerList).prayerName.toString())),
                                Text((viewmodel.prayerlist[index] as PrayerList).PrayerTime.toString())
                              ],),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 20,
                            );
                          },
                          padding:
                              EdgeInsetsDirectional.only(start: 20, end: 20),
                          itemCount: viewmodel.prayerlist.length),
                    ))
              ],
            ),
          );
        });
  }
}

/*class Prayers extends StatefulWidget {
  const Prayers({Key? key}) : super(key: key);

  @override
  State<Prayers> createState() => _PrayersState();
}

class _PrayersState extends State<Prayers> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Prayer Time"),
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () => {Navigator.pop(context)},
          child: Icon(Icons.arrow_back),
        ),
        actions: [
          InkWell(
              onTap: () => {context.showToast("Function Implemented Later ")},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.settings),
              )),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: queryData.size.height /8,
            child: Center(
              child: Container(

                height: queryData.size.height / 2,
                child: Column(
                  children: [Text("Zhur",style: TextStyle(fontSize: 32,color: Colors.white),), Text("1:20 pm",style: TextStyle(fontSize: 22,color: Colors.white))],
                ),
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: queryData.size.height / 2,
                decoration: BoxDecoration(
                    color: const Color(0xfff6f6f6),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              ))
        ],
      ),
    );
  }
}*/
