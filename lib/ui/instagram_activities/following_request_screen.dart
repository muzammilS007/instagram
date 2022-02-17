import 'package:flutter/material.dart';
import 'package:instagram/ui/instagram_activities/following_request_viewmodel.dart';
import 'package:instagram/utils/constants.dart';
import 'package:stacked/stacked.dart';

class FollowingRequest extends StatelessWidget {
  const FollowingRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FollowingRequestViewModel>.reactive(
        viewModelBuilder: () => FollowingRequestViewModel(),
        builder: (context, vm, child) {
          return Scaffold(
            appBar: AppBar(
              title: AnimatedDefaultTextStyle(

                  child: Text("Activity"),
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  duration: Duration(seconds: 3)),
            ),
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 34,
                      backgroundImage: AssetImage(Constants.avatar),
                    ),
                    title: Text("Activity $index"),
                  ),
                );
              },
            ),
          );
        });
  }
}
