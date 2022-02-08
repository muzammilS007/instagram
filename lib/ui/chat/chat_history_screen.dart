import 'package:flutter/material.dart';
import 'package:instagram/ui/search/search_card.dart';
import 'package:instagram/ui/search/search_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'chat_history_viewmodel.dart';

class ChatSettingScreen extends StatelessWidget {
  const ChatSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchScreenViewModel _screenViewModel = SearchScreenViewModel();
    return ViewModelBuilder<ChatHistoryViewModel>.reactive(
        viewModelBuilder: () => ChatHistoryViewModel(),
        builder: (cntx, viewmodel, chile) {
          return SafeArea(
              child: Scaffold(
            appBar: AppBar(
              title: Text("Chat History"),
            ),
                body: Column(
                  children: [
                    SearchCard(reqWidget: (value)=>{},screenViewModel: _screenViewModel,),
                    Expanded(
                      child: ListView.builder(
                        reverse: false,
                        itemCount: 10,
                        itemBuilder: (ctx, index) {
                          return userList(ctx);
                        },
                      ),
                    ),
                  ],
                ),
          ));
        });
  }
  userList(BuildContext context){
   return Card(
     elevation: 5,
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Row(children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
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
                   onTap: () => {},
                   child: Icon(
                     Icons.add,
                     size: 12,
                     color: Colors.white,
                   )),
             ),
           ),
         ),
         Column(children: [
           Text("user 1"),
           Text("message")
         ],)
       ],),
     ),
   );
  }
}


