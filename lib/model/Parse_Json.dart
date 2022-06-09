
  
  // ignore: non_constant_identifier_names
  import 'dart:convert';

List<String> ParseJson(loginRespnse, List<dynamic> platformsList) {
    List<String> alias = new List();
    var allCommunities = loginRespnse['community_id_list'];
    if (allCommunities.length == 0) {
      return alias;
    }
    var selectedOrg = allCommunities[0];
    for (var platformObj in platformsList) {
      var communities = platformObj['communities'];
      if (communities.contains(selectedOrg)) {
        alias.add(platformObj['resource_json']['alias']);
      }
    }
    return alias;
  }

  // ignore: non_constant_identifier_names
  List<String> Cloudsetting(Map<String, dynamic> response_body) {
    List<String> favourworkflows = new List();
    if (response_body['cloud_settings'].containsKey('favouritesFromWorkflow')) {
      List<dynamic> list= jsonDecode(response_body['cloud_settings']['favouritesFromWorkflow']);
      for(String string in list)
         favourworkflows.add(string);
    }
    return favourworkflows;
  }
