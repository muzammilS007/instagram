import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class PostScreen extends StatelessWidget {
  const PostScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final decoration = BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black54
    );
    return Scaffold(
     /* appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          FlatButton(
              onPressed: (){
               // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPostPage()));
              },
              child: Text('Next', style: Theme.of(context).primaryTextTheme.subtitle1?.copyWith(
                  color: Colors.blue
              ),))
        ],
      ),*/
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: Colors.grey,
              child: Stack(
                children: [
                  Positioned.fill(child: Image.asset(
                    'assets/sample/search_demo1.jpg',
                    fit: BoxFit.cover,)),
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                              child: IconButton(
                                  icon: Icon(Icons.zoom_out_map, size: 16, color: Colors.white,),
                                  onPressed: (){


                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) => showOverlayImage(),
                                    );


                                  }),
                              decoration: decoration
                          ),
                          Expanded(child: Container()),
                          Container(
                              child: IconButton(
                                  icon: Icon(Icons.camera, size: 16, color: Colors.white),
                                  onPressed: (){}),
                              decoration: decoration

                          ),
                          SizedBox(width: 16,),
                          Container(
                              child: IconButton(
                                  icon: Icon(Icons.format_shapes, size: 16, color: Colors.white),
                                  onPressed: (){}),
                              decoration: decoration
                          ),
                          SizedBox(width: 16,),
                          Container(
                              child: IconButton(
                                  icon: Icon(Icons.content_copy, size: 16, color: Colors.white),
                                  onPressed: (){}),
                              decoration: decoration

                          )
                        ],
                      ),
                    ),
                    bottom: 0,
                    left: 0,
                    right: 0,
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2
                  ),
                  itemCount: 16,
                  itemBuilder: (context, index) {
                    return InkResponse(
                      child: Image.asset("assets/sample/feed2", fit: BoxFit.cover,),
                      onTap: () {
//                      Navigator.of(context).push(
//                          MaterialPageRoute(builder: (context) => ExplorePage())
//                      );
                      },
                    );
                  })
          )
        ],
      ),
    );
  }
}

Widget showOverlayImage(){

  return Dialog(
    backgroundColor: Colors.black,


    child: Card(
      elevation: 8,
      child: PhotoView(
        imageProvider: AssetImage("assets/sample/search_demo1.jpg"),
      ),
    ),
  );
}

Widget buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    content: SizedBox(
      height : double.infinity,
      width: double.infinity,
      child: Image.asset("assets/sample/search_demo1.jpg", fit: BoxFit.fill,),
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
