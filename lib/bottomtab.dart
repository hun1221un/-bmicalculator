import 'package:flutter/material.dart';
import 'constant.dart';

class bottomtab extends StatelessWidget {
  Function turnpage;
  String bottomtitle;

  bottomtab(this.bottomtitle, this.turnpage);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: turnpage,
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            bottomtitle,
            style: kbottomText,
          ),
        ),
        margin: EdgeInsets.only(top: 50),
        width: double.infinity,
        height: kbottomConatainer,
        color: kcolorBottom,
      ),
    );
  }
}
