import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'api_catfact2_model_class.dart';


class api_catfact2 extends StatefulWidget {
  const api_catfact2({super.key});

  @override
  State<api_catfact2> createState() => _api_catfact2State();
}

class _api_catfact2State extends State<api_catfact2> {

  ///this is catfact detail for uri

  Future<api_catfact22> catfact2Details()async{
    var catfact2 = await http.get(Uri.parse("https://catfact.ninja/fact"));
    return api_catfact22.fromJson(jsonDecode(catfact2.body));
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Api Cat Fact 2 Model",
          style: TextStyle(fontSize: 25),
          ),
        ),
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FutureBuilder(
                future: catfact2Details(),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return Column(
                      children: [
                        Text(snapshot.data!.fact.toString()),
                        Text(snapshot.data!.length.toString())
                      ],
                    );
                  }

                  ///show the any sever error 1st one for error function

                  else if (snapshot.hasError){
                    return Text('${snapshot.error}');
                  }

                  /// By default, show a loading spinner.

                  return CircularProgressIndicator();
            }
            )
          ],
        ),
      ),
    );
  }
}
