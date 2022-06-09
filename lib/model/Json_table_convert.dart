import 'dart:convert';

void test() {
  String myJSON =
      '{"data": [{"agegroupdesc": "18-19", "agegroupbin": 2},{"agegroupdesc": "20-21", "agegroupbin": 3},{"agegroupdesc": "22-24", "agegroupbin": 4},{"agegroupdesc": "25-29", "agegroupbin": 5},{"agegroupdesc": "30-34", "agegroupbin": 6},{"agegroupdesc": "35-39", "agegroupbin": 7},{"agegroupdesc": "40-49", "agegroupbin": 8},{"agegroupdesc": "50-64", "agegroupbin": 9},{"agegroupdesc": "65 AND OVER", "agegroupbin": 10},{"agegroupdesc": "UNDER 18", "agegroupbin": 1}, {"agegroupdesc": "UNKNOWN", "agegroupbin": 0} ], "reply": "hello world"}';

  List<String> desclist = new List<String>();
  List<int> binlist = new List<int>();
  //String nameString = null;
  var json = jsonDecode(myJSON);
  var list = json['data'];
  for (var item in list) {
    desclist.add(item['agegroupdesc']);
    binlist.add(item['agegroupbin']);
  }

  // Print
  print("agegroupdesc:");
  Set<String> set1 = Set.from(desclist);
  set1.forEach((element) => print(element));

  print("");

  print("agegroupbin:");
  Set<int> set2 = Set.from(binlist);
  set2.forEach((element) => print(element));
}
