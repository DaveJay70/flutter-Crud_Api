import 'dart:convert';

import 'package:http/http.dart' as http;

class Api_Executer {
  Future<List<dynamic>> getFacultyApi() async {
    var res = await http.get(
        Uri.parse("https://65ded811ff5e305f32a09ee0.mockapi.io/Faculties"));
    List<dynamic> facultyList = jsonDecode(res.body);
    return facultyList;
  }

  Future<void> deleteFaculty(String id) async {
    var res = await http.delete(
        Uri.parse("https://65ded811ff5e305f32a09ee0.mockapi.io/Faculties/$id"));
    return;
  }

  Future<Map> insertFaculty(Map<dynamic, dynamic> map) async {
    var res = await http.post(
        Uri.parse("https://65ded811ff5e305f32a09ee0.mockapi.io/Faculties"),
        body: map);
    Map<dynamic, dynamic> insert = jsonDecode(res.body);
    return insert;
  }

  Future<Map> updateFaculty(Map<dynamic, dynamic> map) async {
    var res = await http.put(
        Uri.parse(
            "https://65ded811ff5e305f32a09ee0.mockapi.io/Faculties/${map['id'].toString()}"),
        body: map);
    Map<dynamic, dynamic> update = jsonDecode(res.body);
    return update;
  }
}
