/*import 'package:ai.queryai.flutter_app/pages/Home_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'Home_page.dart';
import 'WorkFlows.dart';
class IRIS extends StatefulWidget {
  

 IRIS({Key key, this.title}) : super(key: key);

 final String title;
  @override
  _IRISState createState() => _IRISState();
}

class _IRISState extends State<IRIS> {
   TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
   String MSG;//Contain the input from user
  @override
 Widget build(BuildContext context) {
   final Msg= TextField(
     obscureText: false,
      style: style,
      onChanged:(String str){
        MSG=str;
      },
      decoration: InputDecoration(
          
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Type in",
          
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
   );
    return Scaffold(
      appBar: AppBar(
        title: Text("IRIS"),
        
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
                 Navigator.of(context).push(MaterialPageRoute(
                     builder: (BuildContext context) => HomePage(alias)));
              }
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('IRIS'),
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(
                     builder: (BuildContext context) => IRIS()));
              }
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('WORKFLOWS'),
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(
                     builder: (BuildContext context) => WorkFlows()));
              }
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('account'),
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(
                     builder: (BuildContext context) => LoginPage()));
              }
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: Center(
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 15.0),
            Msg,
          ]
        ),)
    );
  }

  
}*/