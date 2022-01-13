import 'package:flutter/material.dart';

import 'search_screen_viewmodel.dart';

class SearchCard extends StatelessWidget {
  final Function(String)? reqWidget;
  final SearchScreenViewModel? screenViewModel;
  SearchCard({Key? key, this.reqWidget,this.screenViewModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 6.0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: TextField(
          onChanged:(value) {
            reqWidget!(value);
          } ,
          /*     onSubmitted: (value) {
            reqWidget(value ?? "");
          },*/

          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: "Search..",
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            suffixIcon: const Icon(
              Icons.filter_list,
              color: Colors.black,
            ),
            hintStyle: const TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
          maxLines: 1,
          controller: screenViewModel?.searchText.textEditingController,
        ),
      ),
    );
  }
}





/*

*/
