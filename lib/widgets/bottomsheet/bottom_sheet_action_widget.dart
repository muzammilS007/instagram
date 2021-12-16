import 'package:flutter/material.dart';
import 'package:instagram/app_context.dart';
import 'package:instagram/ui/login/login_screen.dart';
import 'package:instagram/utils/share_pref.dart';
import 'package:instagram/widgets/bottomsheet/bottom_sheet_action.dart';

class BottomSheetActionWidget extends StatelessWidget {
  final BottomSheetAction action;

  BottomSheetActionWidget(this.action);

  SharePref sharePref = new SharePref();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.blue.withOpacity(0.1),
      splashColor: Colors.blue.withOpacity(0.3),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(action.iconData),
            SizedBox(
              width: 16,
            ),
            Text(action.title, style: TextStyle(color: action.colors))
          ],
        ),
      ),
      onTap: () {
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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
              break;
            }
        }
      },
    );
  }
}
