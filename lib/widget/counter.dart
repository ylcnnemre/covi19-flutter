import 'package:flutter/material.dart';

import '../constant.dart';

class Counter extends StatelessWidget {
  int number;
  Color color;
  String title;
  Counter({Key key, this.number, this.color, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.all(6),
        height: 20,
        width: 25,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: kInfectedColor.withOpacity(0.26)),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(color: kInfectedColor, width: 2),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text("$number", style: TextStyle(fontSize: 40)),
      Text(
        title,
        style: kSubTextStyle,
      )
    ]);
  }
}
