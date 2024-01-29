import 'dart:convert';

import 'package:flutter/material.dart';

import 'ara_model_class/api_catfact.dart';
import 'package:http/http.dart' as http;

class ap_catfact extends StatefulWidget {
  const ap_catfact({super.key});

  @override
  State<ap_catfact> createState() => _ap_catfactState();
}

class _ap_catfactState extends State<ap_catfact> {

  ///this is catfact detail for uri


  Future<api_catfact> cat_factDetails() async {
    var catfact = await http.get(Uri.parse("https://catfact.ninja/fact"));
    return api_catfact.fromJson(jsonDecode(catfact.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Api For Cast Facts",
            style: TextStyle(fontSize: 25),
            ),
        ),
      ),



      body: Column(
          children: [
        FutureBuilder(
          future: cat_factDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(snapshot.data!.fact.toString()),
                  Text(snapshot.data!.length.toString())
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            /// By default, show a loading spinner.

            return const CircularProgressIndicator();
          },
        ),
      ]),
    );
  }
}
