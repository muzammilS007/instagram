import 'package:flutter/material.dart';

class DropDownCustom extends StatelessWidget {
  final defaultValue;

  final List<String>? items;
  final Function(String)? onClick;

  DropDownCustom({this.defaultValue, this.items, this.onClick});

  @override
  Widget build(BuildContext context) {
    return DropDown(
      items: items,
      defaultValue: defaultValue,
      onClick: onClick,
    );
  }
}

class DropDown extends StatefulWidget {
  final defaultValue;

  final List<String>? items;
  final Function(String)? onClick;

  DropDown({this.defaultValue, this.items, this.onClick});

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  var defaultValue = "Male";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(4)),

      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,

          ),

          value: defaultValue,
          elevation: 8,
          hint: Text("Gender"),
          style: TextStyle(color: Colors.black,fontSize: 16),
          items: widget.items!.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              defaultValue = value!;
            });
            widget.onClick!(value!);
          },
        ),
      ),
    );
  }
}
