import 'package:ai.queryai.flutter_app/api/api_service.dart';
import 'package:ai.queryai.flutter_app/model/Data_LoginToWorkFlow.dart';
import 'package:ai.queryai.flutter_app/model/Parse_Json.dart';
import 'package:ai.queryai.flutter_app/model/login_model.dart';
import 'package:ai.queryai.flutter_app/model/workflow_model.dart';
import 'package:ai.queryai.flutter_app/pages/Table_Page.dart';
import 'package:flutter/material.dart';
import '../ProgressLoad.dart';
import 'login_page.dart';
import 'Home_page.dart';
import 'IRIS.dart';
import 'dart:convert';
// ignore: must_be_immutable
class WorkFlows extends StatefulWidget {
  final String value;
  var newalias;
  var newFWFs;
  var newfromLogin;
  WorkFlows(DatatoWF fromLogin,  {Key key, this.value}) //: super (key:key)
  {
    print("In to workflows page, check favouritesFromWorkflow");
    newfromLogin=fromLogin;
    print(newfromLogin.fWFs);
    
  }
  
  @override
  _WorkFlowsState createState() => _WorkFlowsState(newfromLogin);
}
 /*class Goteded{
    var arr=new List(11);
    Goteded({this.arr});

    facotry Goteded.fromJson(Map<String, dynamic> json)
    {
      return Goteded(
        arr: json['arr'],
      );
    }

    1. build a array of string to contain data
    2. 
  }*/
  
class _WorkFlowsState extends State<WorkFlows> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    String MSG;//Contain the input from user
final String value;
  var newalias;
  List<String> fWFs;
  var newfromLogin;



  _WorkFlowsState(DatatoWF fromLogin, {Key key, this.value}) //: super (key:key)
  {
    newalias = fromLogin.alias;
    //for(int i=0;i<fWorkFlows.length;i++)
    //newFWFs[i] = fWorkFlows[i];
    //fromLogin.fWFs[0]=fromLogin.fWFs[0].substring(2); 
    //fromLogin.fWFs[0]=fromLogin.fWFs[0].substring(0,fromLogin.fWFs[0].length-2); 
    fWFs=fromLogin.fWFs;//[0].split("\",\"");
    newfromLogin=fromLogin;
    
  }

 
 
/*
    var arr=new List(11);
    void stringupdata(){
    arr[0]="Additional Examples";
    arr[1]="Advanced Examples";
    arr[2]="Basic Examples";
    arr[3]="Condition Examples";
    arr[4]="Data Discovery - Elastic";
    arr[6]="Data Discovery - Spluck";
    arr[7]="Elastic Data Availability";
    arr[8]="Elastic ECS Data Discovery";
    arr[9]="Elastic Filebeat Basics";
    arr[10]="Elastic Foundational Workflows";
    }
    */
  int _value =1;
  String platformname;
  LoginRequestModel get loginRequestModel => null;
  WorkFlowRequestModel workFlowRequestModel;


Map<String, dynamic> testmap = {
      
      'data': [{"agegroupdes": "19-19", "ageGroupbin":2}, {"agegroupdes": "20-21", "ageGroupbin": 3}, {"agegroupdes": "22-24", "ageGroupbin": 4}, {"agegroupdes": "25-28", "ageGroupbin": 5}, {"agegroupdes": "29-33", "ageGroupbin": 6}, {"agegroupdes": "34-39", "ageGroupbin": 7}, {"agegroupdes": "40-46", "ageGroupbin": 8}, {"agegroupdes": "47-54", "ageGroupbin": 9}, {"agegroupdes": "55-63", "ageGroupbin": 10}, {"agegroupdes": "64-73", "ageGroupbin": 11}, {"agegroupdes": "74-84", "ageGroupbin": 12}], 
      "reply": "heallo world"
  };
  Map<String, dynamic> testmap1 = {
      
      'data': [{"User ID": "linsong.li@jacks.sdstate.edu", "Login fail times in hour":2}] ,
      "reply": "heallo world"
  };
   Map<String, dynamic> testmap2 = {
      
      'data': [{"User ID": "linsong.li@jacks.sdstate.edu", "Login times in hour":7}] ,
      "reply": "heallo world"
  };
  WorkFlowResponseModel testmode;
 
bool isApiCallProcess = false;

  @override
   void initState() {
    super.initState();
    workFlowRequestModel=new WorkFlowRequestModel();
    testmode=new WorkFlowResponseModel();
    testmode.body=testmap;
  }
     @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }
  Widget _uiSetup(BuildContext context) {
   


    return Scaffold(
      appBar: AppBar(
        title: Text("WorkFlows")
        
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: 
                          Image.asset('assets/images/Query.AI.png'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Home'),
               onTap: (){
                 //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomePage(alias)));
              }
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('IRIS'),
               onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => IRIS()));
              }
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('WORKFLOWS'),
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(
                     builder: (BuildContext context) => WorkFlows(newfromLogin)));
              }
            ),
            
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Log out'),
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(
                     builder: (BuildContext context) => LoginPage()));
              }
            ),
          ],
        ),
      ),
      body:
        
       Center(
         child: Container( padding: EdgeInsets.all(15),
         child: new Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
          children:[Expanded(child: new SingleChildScrollView(
        child: 
        new Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
          children:[
            if(fWFs==null)
              Text("You do not have any favorite workflows yet"),
            if(fWFs!=null)
            for(int i=0;i<fWFs.length;i++)
              Container( 
                padding: EdgeInsets.all(10.0),
                child:
              Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10.0),
        onPressed: () {
          setState(() {
                                isApiCallProcess = true;
                              });
          if (["", null, false, 0].contains(platformname)) {
            if (newalias.length > 0) {
              platformname = newalias[0];
            } else {
              platformname = "";
            }
          }
          workFlowRequestModel.query="run workflow "+fWFs[i];
          print(workFlowRequestModel.query);
          workFlowRequestModel.alias= platformname;
         print(workFlowRequestModel.alias);
          //workFlowRequestModel.connectionparams={};
          workFlowRequestModel.orgname="";
          workFlowRequestModel.timetext="";
          //workFlowRequestModel.workflowparams={};
        
          APIService apiService = new APIService();
          apiService.workflow(workFlowRequestModel).then((value) {
            print("api called, try to encode");
            JsonEncoder encoder = new JsonEncoder.withIndent(' ');
          
          print("done tring, try to print now");
          print(encoder.convert(value.body));
        setState(() {
                                isApiCallProcess = false;
                              });
          Navigator.push(context, MaterialPageRoute(builder: (context){return TablePage(value); }));
          
        });},
        child: Text(fWFs[i],
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0).copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      ),
            //Text("You do not have any favorite workflows yet"),

              )
          ],
       
        ),
      ),
          ),
         
                        DropdownButton(value: _value, items: [
                          for (int i=1; i<=newalias.length; i++)
                        DropdownMenuItem(child: Text(newalias[i-1]),value:i),
                        ], onChanged: (value){
                          setState((){
                            _value=value;
                            platformname=newalias[_value-1];
                          });
                        }),
             
          ]
          
          )
        ))
    );
  }
  }