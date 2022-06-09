/*import 'package:flutter/material.dart';

import 'login_page.dart';
import 'IRIS.dart';
import 'WorkFlows.dart';
// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  final String value;
  var newalias;
  HomePage(List<String> alias, {Key key, this.value}) //: super (key:key)
  {
    print(alias);
    newalias = alias;
  }
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/Query.AI.png',
         width: 100,
          height:  50,
          fit: BoxFit.contain),
        
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
                     builder: (BuildContext context) => WorkFlows(alias)));
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
        child: Column(

                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/images/Query.AI.png'),

                       ]
                    ),
                   Text("The main page, Introduction of Query AI"),
                   ]


        ),
      ),
    );
  }
  }*/
