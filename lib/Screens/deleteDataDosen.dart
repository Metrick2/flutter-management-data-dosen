import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_uas/Model/dbDosen.dart';
import 'package:project_uas/Screens/getDatasDosen.dart';

class deleteDataDosen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return deleteDataDosenState();
  }
}

Future<DosenModel> deleteDataDosens(String nama, String nip) async {
  var Url = "http://10.0.2.2:8080/api/delete";
  var response = await http.delete(
    Url,
    headers: <String, String>{
      "Content-Type": "application/json;charset=UTF-8,"
    },
  );
  return DosenModel.fromJson(jsonDecode(response.body));
}

class deleteDataDosenState extends State<deleteDataDosen> {
  @override
  Widget build(BuildContext context) {
    return getDataDosens();
  }
}
