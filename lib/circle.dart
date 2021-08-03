import 'package:flutter/material.dart';

class CircleBotton extends StatelessWidget {

  final Function adjust;
  final IconData operator;

  CircleBotton(this.adjust, this.operator);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      onPressed: adjust,
      constraints: const BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      child: Icon(operator),
    );
  }
}