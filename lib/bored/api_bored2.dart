import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

import 'package:http/http.dart' as http;

import 'api_bored2_model_class.dart';

class bored2 extends StatefulWidget {
  const bored2({super.key});

  @override
  State<bored2> createState() => _bored2State();
}

class _bored2State extends State<bored2> {

  ///this is bored detail for uri

  Future<bored22> bored222() async {
    var result = await http.get(Uri.parse("https://www.boredapi.com/api/activity"));
    return bored22.fromJson(jsonDecode(result.body));
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
            FutureBuilder(future: bored222(),
                builder: (context, snapsort) {
              if (snapsort.hasData) {
                return Column(
                  children: [
                    Text(snapsort.data!.activity.toString()),
                    Text(snapsort.data!.type.toString()),
                    Text(snapsort.data!.participants.toString()),
                    Text(snapsort.data!.price.toString()),
                    Text(snapsort.data!.link.toString()),
                    Text(snapsort.data!.key.toString()),
                    Text(snapsort.data!.accessibility.toString()),
                  ],
                );
              }

              ///show the any sever error 1st one for error function

              else if (snapsort.hasError) {
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
