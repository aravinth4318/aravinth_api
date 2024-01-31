import 'dart:convert';

import 'package:aravinth_api/public/public_2_model.dart';
import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

import 'package:http/http.dart' as http;

class public2 extends StatefulWidget {
  const public2({super.key});

  @override
  State<public2> createState() => _public2State();
}

class _public2State extends State<public2> {
  ///this public uri drtails

  Future<public2>? _future;

  Future<List<Entries>> detia() async {
    var result =
        await http.get(Uri.parse("https://api.publicapis.org/entries"));
    var data = jsonDecode(result.body)["entries"];
    return (data as List).map((objicet) => Entries.fromJson(objicet)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Api For Public",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder<List<Entries>>(
              future: detia(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  List<Entries> list = snapshot.data!;
                  return Column(
                    children: [
                      Container(
                        height: 700,
                        child: ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: Icon(Icons.menu),
                                title: Center(child: Text(list[index].aPI.toString())),
                                trailing: Text("Api"),
                              );
                            }),
                      )
                    ],
                  );
                }
        
                ///show the any sever error 1st one for error function
        
                else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
        
                /// By default, show a loading spinner.
        
                return CircularProgressIndicator();
              } ),
        ),
      ),
    );
  }
}
