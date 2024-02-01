import 'dart:convert';

import 'package:aravinth_api/gtsuvai/resut_2_model.dart';
import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

import 'package:http/http.dart' as http;

class resut extends StatefulWidget {
  const resut({super.key});

  @override
  State<resut> createState() => _resutState();
}

class _resutState extends State<resut> {
  
  ///this code fopr uri details
  
  Future<resut>? _future;
  Future <List<RestaurantDtls>> details() async {
    var result = await http.get(Uri.parse("http://gtsuvai.gtcollege.in/Master/GetRestaurantDetails"));
    var data = jsonDecode(result.body) ["restaurantDtls"];
    return (data as List).map((obj) => RestaurantDtls.fromJson(obj)).toList();
  }


  @override
  Widget build(BuildContext context) {

    ///container responsive work details for height

    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
          child: Text("Api For Restaurant",
          style: TextStyle(fontSize: 25),),
        ),
      ),



      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder <List<RestaurantDtls>>
            (future: details(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                List<RestaurantDtls> res = snapshot.data!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: height,
                      child: ListView.builder(
                        itemCount: res.length,
                          itemBuilder: (BuildContext context, int index){
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("${res[index].restaurantId}"),
                                Text("${res[index].restaurantName}"),
                                Text("${res[index].mobileNo}"),
                                Text("${res[index].address}"),
                                Text("${res[index].pincode}"),
                                Text("${res[index].restaurantImage}"),
                                Text("${res[index].restaurantRating}"),
                                Text("${res[index].latitude}"),
                                Text("${res[index].longtitude}"),
                                Text("${res[index].type}"),
                                Text("${res[index].shortAddress}"),
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
