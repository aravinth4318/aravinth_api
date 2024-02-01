import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

import 'package:http/http.dart' as http;

import 'offer_1_model.dart';


class offerlink extends StatefulWidget {
  const offerlink({super.key});

  @override
  State<offerlink> createState() => _offerlinkState();
}

class _offerlinkState extends State<offerlink> {
  
  ///this code for uri details
  
  Future<link1>? _future;
  
  Future <List<OfferDtls>> details() async {
    var result = await http.get(Uri.parse("http://gtsuvai.gtcollege.in/Offer/GetOffer"));
    var data = jsonDecode(result.body) ["offerDtls"];
    return (data as List).map((obj) => OfferDtls.fromJson(obj)).toList();
  }

  
  @override
  Widget build(BuildContext context) {

    ///container responsive work details for height

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Center(
          child: Text("Api For Offer",
            style: TextStyle(fontSize: 25),),
        ),
      ),



      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder <List<OfferDtls>> (
            future: details(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
              List<OfferDtls> offer = snapshot.data!;
              return Column(
                children: [
                  Container(
                    height: height,
                    child: ListView.builder(
                      itemCount: offer.length,
                        itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Text("${offer[index].offerId}"),
                            SizedBox(height: 30,),
                            Text("${offer[index].resName}"),
                            SizedBox(height: 30,),
                            Text("${offer[index].resImage}"),
                            SizedBox(height: 30,),
                            Text("${offer[index].offerImage}"),
                            SizedBox(height: 30,),
                            Text("${offer[index].validFrom}"),
                            SizedBox(height: 30,),
                            Text("${offer[index].validTo}"),
                            SizedBox(height: 30,),
                            Text("${offer[index].description}"),
                          ],
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
