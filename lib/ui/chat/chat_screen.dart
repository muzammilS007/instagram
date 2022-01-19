import 'package:flutter/material.dart';
import 'package:instagram/ui/chat/chat_viewmodel.dart';
import 'package:instagram/widgets/input_fields/text_field.dart';
import 'package:stacked/stacked.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 22,
            backgroundImage: NetworkImage(
              "https://1.bp.blogspot.com/-0ZUMPsBahSo/X0vuBttwtWI/AAAAAAAAdwM/_0Nuxi-PWUsgTsLdAmGZqILPiJf7N2bdACLcBGAsYHQ/s1600/best%2Bdp%2Bfor%2Bwhatsapp%2B%25281%2529.jpg",
            ),
          ),
        ),
        title: Text("John Doe"),
      ),
      body: ViewModelBuilder.reactive(
          viewModelBuilder: () => ChatViewModel(),
          builder: (context, viewmodel, child) {
            return Column(
              children: [
                ListView.builder(
                  reverse: true,
                  itemCount: 12,
                  itemBuilder: (ctx, index) {
                    return Text("data");
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFieldCustom(
                              onClick: () => {}, hintTxt: "enter message"),
                        ),
                        flex: 1,
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
