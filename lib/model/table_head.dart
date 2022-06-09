import 'package:flutter/material.dart';

import 'table_cell.dart';


class TableHead extends StatelessWidget {
  final ScrollController scrollController;
  final List<List<dynamic>> input;
  TableHead({
    @required this.scrollController,
    @required this.input,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          MultiplicationTableCell(
            color: Colors.blueGrey.withOpacity(0.3),
            value: "Count",
            cwidth: 50,
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [for(int i=0;i< input.length;i++)
                 MultiplicationTableCell(
                  color: Colors.blueGrey.withOpacity(0.3),
                  value: input[i][0],
                  
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}
