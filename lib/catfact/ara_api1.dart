import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'api_catfact1_model_class.dart';

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



      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          FutureBuilder(
            future: cat_factDetails(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Column(
                    children: [
                      Text(snapshot.data!.fact.toString(),
                      style: TextStyle(fontSize: 20),),
                      SizedBox(height: 100,),
                      Text(snapshot.data!.length.toString(),
                      style: TextStyle(fontSize: 20),)
                    ],
                  ),
                );

                ///show the any sever error 1st one for error function

              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              /// By default, show a loading spinner.


              return const CircularProgressIndicator();
            },
          ),
        ]),
      ),
    );
  }
}
