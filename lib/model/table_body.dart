import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import 'table_cell.dart';


class TableBody extends StatefulWidget {
  final ScrollController scrollController;
  final List<List<dynamic>> input;
  
  TableBody({
    @required this.scrollController,
    @required this.input,
  });

  @override
  _TableBodyState createState() => _TableBodyState(input: input);
}

class _TableBodyState extends State<TableBody> {
  LinkedScrollControllerGroup _controllers;
  ScrollController _firstColumnController;
  ScrollController _restColumnsController;
  
final List<List<dynamic>> input;
  _TableBodyState({
    
    @required this.input,
  });
  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _firstColumnController = _controllers.addAndGet();
    _restColumnsController = _controllers.addAndGet();
    
  }

  @override
  void dispose() {
    _firstColumnController.dispose();
    _restColumnsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: ListView(
            controller: _firstColumnController,
            physics: ClampingScrollPhysics(),
            children: List.generate(input[input.length-1].length-1, (index) {
              return MultiplicationTableCell(
                color: Colors.yellow.withOpacity(0.3),
                value: (index + 1).toString(),
                cwidth: 50,
              );
            }),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: widget.scrollController,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: SizedBox(
              width: (input[input.length-1].length-1) * cellwidth,
              child: ListView(
                controller: _restColumnsController,
                physics: const ClampingScrollPhysics(),
                children:[for(int y=1;y< input[0].length;y++)
                   Row(
                    children: [for(int x=0;x< input.length;x++)(
                       MultiplicationTableCell(
                        value: input[x][y],
                        
                      )
                      )
                    ]
                  )
            ]
              ),
            ),
          ),
        ),
      ],
    );
  }
}
