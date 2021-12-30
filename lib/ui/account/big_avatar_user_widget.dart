import 'package:flutter/material.dart';
import 'package:instagram/utils/constants.dart';

class BigAvatarUserWidget extends StatefulWidget {
  final imagePath;
  final width;
  final height;
  final Function click;

  BigAvatarUserWidget({this.imagePath, this.height, this.width, this.click});

  @override
  _BigAvatarUserWidgetState createState() => _BigAvatarUserWidgetState();
}

class _BigAvatarUserWidgetState extends State<BigAvatarUserWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? Constants.avatarWidthDefault,
      height: widget.height ?? Constants.avatarHeightDefault,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              child: CircleAvatar(
            backgroundImage: AssetImage(
                '${widget.imagePath ?? Constants.defaultAvatarPlaceholder}'),
          )),
          Positioned(
            child: ClipOval(
              child: Container(
                height: 30,
                width: 30,
                decoration: ShapeDecoration(
                    color: Colors.blueAccent,
                    shape: CircleBorder(
                      side: Divider.createBorderSide(context,
                          width: 2, color: Theme.of(context).cardColor),
                    )),
                padding: EdgeInsets.all(2),
                alignment: Alignment.center,
                child: InkWell(
                  onTap: ()=>{
                    widget.click()
                  },
                    child: Icon(
                  Icons.add,
                  size: 12,
                  color: Colors.white,
                )),
              ),
            ),
            right: 0,
            bottom: 0,
          )
        ],
      ),
    );
  }
}
