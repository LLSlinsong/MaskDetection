import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login_model.dart';
import '../model/workflow_model.dart';

import 'package:flutter_session/flutter_session.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "https://app.query.ai/api/user/v2/login"; 
    String aurthurl = "https://app.query.ai/api/user/generate_jwt";

    final response = await http.post(url, body: json.encode(requestModel.toJson())); 
     print(response.headers['set-cookie']);
    if (response.statusCode == 200 || response.statusCode == 405) {   // Login secceed or wrong password
     
      await FlutterSession().set('Cookie', response.headers['set-cookie']); 
      final responseJWT= await http.get(aurthurl,
      headers: {'Cookie':await FlutterSession().get('Cookie')});
      print('print JWT token Cookie:');
      print(responseJWT.body);
      await FlutterSession().set('JWTtoken', json.decode(responseJWT.body)['token']);
      print("Saved the login info\n");
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {  // Login failed
      return LoginResponseModel.fromJson(
        json.decode(response.body)); 
    }
  }






  Future<WorkFlowResponseModel> workflow(WorkFlowRequestModel requestModel) async {
    
    String url = "https://proxy.query.ai/api/v1/query"; 

    var token = await FlutterSession().get('JWTtoken');
    print("authorization token is:");
    print(token);
    print(json.encode(requestModel.toJson()));
    final response = await http.post(url, 
          headers: {'Authorization': token},
          body: json.encode(requestModel.toJson())); 
    JsonEncoder encoder = new JsonEncoder.withIndent(' ');
    


          print("In the API requesting, printing response");
          print(encoder.convert(response.body));
    return WorkFlowResponseModel.fromJson(
      json.decode(response.body),
    );
  }

  platformSettings() async {
    
    String url = "https://app.query.ai/api/resource/get/1";  
    final response = await http.get(url, 
          headers: {'Cookie':await FlutterSession().get('Cookie')}
          ); 
    return json.decode(response.body);
          
  }
}

