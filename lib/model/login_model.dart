class LoginResponseModel {
  final String error;
  Map<String, dynamic> body;

  LoginResponseModel({this.error, this.body});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      error: json["message"] != "OK" ? json["message"] : "",
      body: json,
    );
  }
}

class LoginRequestModel {
  
  String email;
  String lic;
  String token;
  String timezone;
  

  LoginRequestModel({
    
    this.email,
    this.lic,
    this.token,
    this.timezone
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      
      'email': email.trim(),
      'lic': lic.trim(),
      'token': token.trim(),
      'timezone': timezone.trim(),
    };

    return map;
  }
}
