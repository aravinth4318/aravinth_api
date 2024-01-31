import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'api_bored1_model_class.dart';


class api_bored1 extends StatefulWidget {
  const api_bored1({super.key});

  @override
  State<api_bored1> createState() => _api_bored1State();
}

class _api_bored1State extends State<api_bored1> {


  ///this is bored detail for uri

  Future<bored1> bored1Details() async {
    var result = await http.get(Uri.parse("https://www.boredapi.com/api/activity"));
    return bored1.fromJson(jsonDecode(result.body));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Api For Bored",
          style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FutureBuilder(
                future: bored1Details(),
                builder: (context, snapsort) {
                  if (snapsort.hasData){
                    return Center(
                      child: Column(
                        children: [
                          Text(snapsort.data!.activity.toString(),
                          style: TextStyle(fontSize: 20),),
                          SizedBox(height: 20,),
                          Text(snapsort.data!.accessibility.toString(),
                          style: TextStyle(fontSize: 20),),
                          SizedBox(height: 20,),
                          Text(snapsort.data!.type.toString(),
                            style: TextStyle(fontSize: 20),),
                          SizedBox(height: 20,),
                          Text(snapsort.data!.participants.toString(),
                            style: TextStyle(fontSize: 20),),
                          SizedBox(height: 20,),
                          Text(snapsort.data!.price.toString(),
                            style: TextStyle(fontSize: 20),),
                          SizedBox(height: 20,),
                          Text(snapsort.data!.link.toString(),
                            style: TextStyle(fontSize: 20),),
                          SizedBox(height: 20,),
                          Text(snapsort.data!.key.toString(),
                            style: TextStyle(fontSize: 20),),
                        ],
                      ),
                    );
                  }

                  ///show the any sever error 1st one for error function

                  else if (snapsort.hasError){
                    return Text('${snapsort.error}');
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
