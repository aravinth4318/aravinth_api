import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

import 'package:http/http.dart' as http;

import 'item_3_model.dart';

class iteam extends StatefulWidget {
  const iteam({super.key});

  @override
  State<iteam> createState() => _iteamState();
}

class _iteamState extends State<iteam> {



  ///this code for uri details
  
  Future <item>? _future;
  Future <List<ItemDtls>> details() async {
    var result = await http.get(Uri.parse("http://gtsuvai.gtcollege.in/Master/GetItemDetails?CategoryId=0"));
    var data = jsonDecode(result.body) ["itemDtls"];
    return ( data as List).map((obj) => ItemDtls.fromJson(obj)).toList();
  }
  


  @override
  Widget build(BuildContext context) {

    ///container responsive work details for height
    
    final height = MediaQuery.of(context).size.height;    
    
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(
          child: Text("Api For Item",
            style: TextStyle(fontSize: 25),),
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder <List<ItemDtls>> (
            future: details(),
            builder: (BuildContext context, snapshot){
              if (snapshot.hasData) {
                List<ItemDtls> ite = snapshot.data!;
                return Column(
                  children: [
                    Container(
                      height: height,
                      child: ListView.builder(
                        itemCount: ite.length,
                          itemBuilder: (BuildContext context, int index){
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("${ite[index].itemId}"),
                              SizedBox(height: 30,),
                              Text("${ite[index].type}"),
                              SizedBox(height: 30,),
                              Text("${ite[index].categoryId}"),
                              SizedBox(height: 30,),
                              Text("${ite[index].categoryName}"),
                              SizedBox(height: 30,),
                              Text("${ite[index].itemName}"),
                              SizedBox(height: 30,),
                              Text("${ite[index].itemImage}"),
                            ],
                          );
                      }
                      ),
                    )
                  ],
                );
              }

              ///show the any sever error 1st one for error function

              else if(snapshot.hasError){
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
