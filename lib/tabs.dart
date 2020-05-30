import 'package:flutter/material.dart';

const issel = const Color(0xffFF3636);
class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 0),
        MyTab(text: '', isSelected: false),
        MyTab(text: 'Algeria', isSelected: false),
        MyTab(text: 'Spain', isSelected: true),
        MyTab(text: 'USA', isSelected: false),
        MyTab(text: 'Chaina', isSelected: false),
      ],
    );
  }
}

class MyTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const MyTab({Key key, @required this.isSelected, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: 10,
            ),
            width: 60,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(0),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(0)),
              color: isSelected ? Color(0xFFFFEDED) : Colors.white,
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: isSelected ? 18 : 16,
                color: isSelected ? issel : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
          // Text(
          //   text,
          //   style: TextStyle(
          //     fontSize: isSelected ? 18 : 16,
          //     color: isSelected ? Colors.black : Colors.grey,
          //     fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          //   ),
          // ),
          // Container(
          //   height: 6,
          //   width: 20,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(4),
          //     color: isSelected ? Color(0xFFFF5A1D) : Colors.white,
          //   ),
        ],
      ),
    );
  }
}
