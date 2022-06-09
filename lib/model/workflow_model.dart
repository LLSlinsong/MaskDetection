class WorkFlowResponseModel {
 
   Map<String, dynamic> body;

  WorkFlowResponseModel({this.body});

  factory WorkFlowResponseModel.fromJson( json) {
    return WorkFlowResponseModel(
      
      body: json,

    );
  }


}

class WorkFlowRequestModel {
  
  var query;
  var alias;
 // var connection_params;
 // var workflow_params;
  var timetext;
  var orgname;
  

  WorkFlowRequestModel({
    
    this.query,
    this.alias,
   // this.connection_params,
    //this.workflow_params,
    this.timetext,
    this.orgname
  });

   Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      
      'query': query.trim(),
      'alias': alias.trim(),
      'connection_params': {},
      'workflow_params': {},
      'time_text': "",
      'org_name': "",
    };

    return map;
  }
}
