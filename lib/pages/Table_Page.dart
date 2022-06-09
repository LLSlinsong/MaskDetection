import 'dart:convert';

import 'package:ai.queryai.flutter_app/model/multiplication_table.dart';
import 'package:ai.queryai.flutter_app/model/workflow_model.dart';
import 'package:ai.queryai.flutter_app/api/api_service.dart';
import 'package:ai.queryai.flutter_app/model/Data_LoginToWorkFlow.dart';
import 'package:ai.queryai.flutter_app/model/Parse_Json.dart';
import 'package:ai.queryai.flutter_app/model/login_model.dart';
import 'package:ai.queryai.flutter_app/model/workflow_model.dart';
import 'package:ai.queryai.flutter_app/pages/Table_Page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
class TablePage extends StatefulWidget {
  final String value;
  var newalias;
  var newFWFs;
  var newfromWF;
  TablePage(WorkFlowResponseModel fromWF,  {Key key, this.value}) //: super (key:key)
  {
    print("In to Table page");
    newfromWF=fromWF;
    print(newfromWF);
    
  }
  
  @override
  _TablePageState createState() => _TablePageState(newfromWF);
}
class _TablePageState extends State<TablePage> {
  final String value;
    var newfromWF;
    List<List<dynamic>> thisList = new List<List<dynamic>>();
  _TablePageState(WorkFlowResponseModel fromWF,  {Key key, this.value}) //: super (key:key)
  {
    print("In to Table page state");
    newfromWF=fromWF;
    print(newfromWF);                                            
    List<List<dynamic>> colList = new List<List<dynamic>>();
    int j=0;
    if(fromWF.body.containsKey('data'))
       for (var string in fromWF.body['data'])
         {
           print(string);
         
         
         
         
           for(var name in string.keys)
           {
             print(name);
              String thisname;
              thisname=name;
              bool foundthisCol=false;
              for(int i=0; i< colList.length; i++)
              {
                
                  if(colList[i][0]==thisname)
                  {foundthisCol=true;
                   while(colList[i].length-1<j)
                    colList[i].add("");
                    colList[i].add(string[thisname].toString());
                  }
              }if (!foundthisCol)
              {
                    List<dynamic> tem= new List<dynamic>();
                    tem.add(thisname);
                    for(int i=0;i<j;i++)
                    tem.add("");
                    tem.add( string[thisname].toString());
                    colList.add(tem);
              }

           }
           j++;
         

       } 
       else {List<dynamic> tem= new List<dynamic>();
       if(fromWF.body.containsKey('statues'))
                    tem.add("data not found");
                    print("data not found");
                    colList.add(tem);}
       thisList=colList;
       print("going to complete table");
       for(int y=0;y<j;y++)
       {
          for(int i=0;i<thisList.length;i++)
          {
            if(thisList[i][y]==null)
            {
              thisList[i][y]="";
            }
          }
       }
  }
  
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(appBar: AppBar(title: Text("Data Table"),backgroundColor: Colors.grey,),
     body: Center(
         child: Container( 
           
          child: MultiplicationTable(input: thisList),
         
                       ))
      );
             
         
                       
         
  }
}