import 'package:flutter/material.dart';

const double cellhigh = 50;
const double cellwidth =200;
class MultiplicationTableCell extends StatelessWidget {
  final String value;
  final Color color;
final double cwidth;

  MultiplicationTableCell({
    this.value,
    this.color,
    this.cwidth=cellwidth,
  });

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      width: cwidth,
      height: cellhigh,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black12,
          width: 1.0,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        '${value ?? ''}',
        style: TextStyle(fontSize: 16.0),
        
      ),
    );
  }
}
