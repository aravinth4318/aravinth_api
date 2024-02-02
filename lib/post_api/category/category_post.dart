import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';


import 'package:http/http.dart' as http;

import 'category_post_model.dart';


class catpost extends StatefulWidget {
  const catpost({super.key});

  @override
  State<catpost> createState() => _catpostState();
}

class _catpostState extends State<catpost> {
  
  
  final TextEditingController textcat = TextEditingController();
  final TextEditingController texdes = TextEditingController();



  Future<bool>? _success;
  Future<bool> addCat(String category, String desc) async
  {
    var result = await http.post(
      Uri.parse("http://catodotest.elevadosoftwares.com/Category/InsertCategory"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>
      {
        "categoryId ": 0,
          "category ": category ,
          "description":  desc,
          "createdBy": 1
      }
      ),
    );

    return jsonDecode(result.body) ["success"];

  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Post Api For Category",
          style: TextStyle(fontSize: 25),),
        ),
      ),

      body: Column(
        children: [
          Container(
            child: (_success == null) ? buildColumn() : buildFutureBuilder() ,
          )
        ],
      ),
    );
  }


  Column buildColumn () {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: textcat,
          decoration: InputDecoration(
            hintText: "Enter Category"
          ),
        ),
        TextFormField(
          controller: texdes,
          decoration: InputDecoration(
              hintText: " Enter Dec"
          ),
        ),
        ElevatedButton(
            onPressed: (){
              setState(() {
                _success = addCat(textcat.text, texdes.text);
              });

            }, child: Text("Creat Data")),
      ],
    );

  }


  FutureBuilder buildFutureBuilder() {
    return FutureBuilder(
        future: _success,
        builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!.toString());
      }
      else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
    );
  }






}
