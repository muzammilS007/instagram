import 'package:flutter/material.dart';

class StoryItemWidget extends StatefulWidget {
  static const ROUTE_NAME = 'StoryItemWidget';
  @override
  _StoryItemWidgetState createState() => _StoryItemWidgetState();
}

class _StoryItemWidgetState extends State<StoryItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: FittedBox(
        child: Container(
          width: 80,
          height: 96,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 72,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: ClipOval(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.red[500], Colors.pink],
                              )
                          ),
                          padding: EdgeInsets.all(2),
                          child: CircleAvatar(
                              radius: 34,
                              backgroundImage : AssetImage('assets/sample/ic_avatar_1.jpg')
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text('dangngocduc', style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Color(0xFF101010)
                ),),
              )
            ],
          ),
        ),
        fit: BoxFit.scaleDown,
      ),
      onTap: () {
/*        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => StoryPage(),
        ));*/
      },
    );
  }
}
