import 'package:flutter/material.dart';
import 'package:instagram/ui/login/login_screen.dart';
import 'package:instagram/utils/navegation_helper.dart';
import 'package:instagram/utils/share_pref.dart';
import 'package:instagram/widgets/bottomsheet/bottom_sheet_action_widget.dart';

import 'bottom_sheet_action.dart';

class BottomSheetScrollable extends StatelessWidget {
  final List<BottomSheetAction>? actions;
  final ScrollController? scrollController;

  BottomSheetScrollable({this.actions, this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Container(
              width: 64,
              height: 8,
              decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: Theme.of(context).dialogBackgroundColor),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(top: 16),
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16))),
                color: Theme.of(context).dialogBackgroundColor),
            child: Material(
              color: Theme.of(context).dialogBackgroundColor,
              child: SafeArea(
                  child: ListView(
                shrinkWrap: true,
                controller: scrollController,
                children: actions
                    !.map(
                      (action) => BottomSheetActionWidget(
                        action: action,
                        onClicks: () => {
                          bottomSheetClickHandler(action,context)
                        },
                      ),
                    )
                    .toList(),
              )),
            ),
          ))
        ],
      ),
    );
  }



  void bottomSheetClickHandler(BottomSheetAction action,BuildContext context)
  {
    final sharePref = new SharePref();
    switch (action.id) {
      case 1:
        {
          Navigator.pop(context, action);
          break;
        }
      case 2:
        {
          Navigator.pop(context, action);
          break;
        }
      case 3:
        {
          Navigator.pop(context, action);
          break;
        }
      case 4:
        {
          Navigator.pop(context, action);
          break;
        }
      case 5:
        {
          Navigator.pop(context, action);
          break;
        }
      case 6:
        {
          Navigator.pop(context, action);
          break;
        }
      case 7:
        {
          sharePref.setLoginStatus(false);
          MoveToDestinationAndRemoveStack(context).moveDestination(LoginScreen());
       /*   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              LoginScreen()), (Route<dynamic> route) => false);*/

          break;
        }
    }
  }
}


