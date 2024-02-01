import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

import 'package:http/http.dart' as http;

import 'natio_model_1.dart';

class nati1 extends StatefulWidget {
  const nati1({super.key});

  @override
  State<nati1> createState() => _nati1State();
}

class _nati1State extends State<nati1> {

  ///this is bored detail for uri
  
  Future<national>? _future;
  Future<List<Country>> details() async {
    var result = await http.get(Uri.parse("https://api.nationalize.io?name=nathaniel"));
    var data = jsonDecode(result.body) ["country"];
    return (data as List).map((obj) => Country.fromJson(obj)).toList();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Api For Nationalize.io",
          style: TextStyle(fontSize: 25),),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder <List<Country>> (
              future: details(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  List<Country> countrylist = snapshot.data!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 700,
                        child: ListView.builder(
                          itemCount: countrylist.length,
                            itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                leading: Icon(Icons.list),
                                title: Center(
                                 child: Text(countrylist[index].countryId.toString())),
                              subtitle: Center(child: Text(countrylist[index].probability.toString())),
                              trailing: Icon(Icons.more_vert_sharp),
                            );
                            }
                        ),
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
              }
          ),
        ),
      ),

    );
  }
}
