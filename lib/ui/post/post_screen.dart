import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:instagram/utils/dialog_helper.dart';
import 'package:instagram/utils/image_file.dart';
import 'package:local_image_provider/device_image.dart';
import 'package:stacked/stacked.dart';
import 'package:transparent_image/transparent_image.dart';

import 'post_viewmodel.dart';
import 'setting_post_screen.dart';

class PostScreen extends StatelessWidget {
  PostScreen({Key? key}) : super(key: key);
/*  final List<dynamic> imageList = [
    'https://cdn-prod.medicalnewstoday.com/content/images/articles/325/325466/man-walking-dog.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
  ];*/

  @override
  Widget build(BuildContext context) {
    //getLatestImages();
    //getAllImages();
    final decoration =
        BoxDecoration(shape: BoxShape.circle, color: Colors.black54);
    return Scaffold(
      body: ViewModelBuilder<PostViewModel>.reactive(
        onModelReady: (v)=>{v.setImageList()},
          viewModelBuilder: () => PostViewModel(),
          builder: (cntx, viewmodel, child) {
            return Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    color: Colors.grey,
                    child: Stack(
                      children: [
                        //assets/sample/search_demo1.jpg
                        Positioned.fill(
                          child: Image.asset(
                            'assets/sample/search_demo1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),

                        Positioned(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                              child: ElevatedButton(
                                onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SettingPostScreen()))
                                },
                                child: Text("Next"),
                              ),
                            ),
                          ),
                          top: 0,
                          right: 0,
                        ),
                        Positioned(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Container(
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.zoom_out_map,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                showOverlayImage(
                                                    "assets/sample/search_demo1.jpg"),
                                          );
                                        }),
                                    decoration: decoration),
                                Expanded(child: Container()),
                                Container(
                                    child: IconButton(
                                        icon: Icon(Icons.camera,
                                            size: 16, color: Colors.white),
                                        onPressed: () {}),
                                    decoration: decoration),
                                SizedBox(
                                  width: 16,
                                ),
                                Container(
                                    child: IconButton(
                                        icon: Icon(Icons.format_shapes,
                                            size: 16, color: Colors.white),
                                        onPressed: () {}),
                                    decoration: decoration),
                                SizedBox(
                                  width: 16,
                                ),
                                Container(
                                    child: IconButton(
                                        icon: Icon(Icons.content_copy,
                                            size: 16, color: Colors.white),
                                        onPressed: () {}),
                                    decoration: decoration)
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
                    child: Container(
                  margin: EdgeInsets.all(4),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2),
                      itemCount: viewmodel.imageList.length,
                      itemBuilder: (context, index) {
                        return InkResponse(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              child: false
                                  ? FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image: viewmodel.imageList[index],
                                      fit: BoxFit.cover,
                                    )
                                  : Image(image: DeviceImage(viewmodel.imageList[index])),
                            ),
                          ),
                          onTap: () {
//                      Navigator.of(context).push(
//                          MaterialPageRoute(builder: (context) => ExplorePage())
//                      );
                          },
                        );
                      }),
                ))
              ],
            );
          }),
    );
  }
}
