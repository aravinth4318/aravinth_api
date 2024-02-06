import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

import 'package:http/http.dart' as http;

class task extends StatefulWidget {
  const task({super.key});

  @override
  State<task> createState() => _taskState();
}

class _taskState extends State<task> {

  final TextEditingController client = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController c = TextEditingController();
  final TextEditingController d = TextEditingController();
  final TextEditingController e = TextEditingController();
  final TextEditingController f = TextEditingController();
  final TextEditingController h = TextEditingController();
  final TextEditingController i = TextEditingController();
  final TextEditingController j = TextEditingController();
  final TextEditingController k = TextEditingController();

  ///this code for uri details


  Future<bool>? _success;
  Future<bool> details(
      String client,
      String category,
      String c,
      String d,
      String e,
      String f,
      String g,
      String h,
      String i,
      String j,
      String k,
      ) 
  async {
    var result = await http.post(Uri.parse("http://catodotest.elevadosoftwares.com/Allocation/InsertAllocation"),
      headers:  <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{

        "allocationId": 0,
        "clientId": 1,
        "categoryId": 1,
        "employeeId": 1,
        "description": "tgdghf",
        "scheduledDate": "2023-03-17",
        "dueDate": "2023-03-19",
        "status": "Yet To Start",
        "startedDate": "",
        "completedDate": "",
        "uploadsPath": "",
        "createdBy": 1
      }
      )

    );
  }









  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
