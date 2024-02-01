import 'package:aravinth_api/public/public_1.dart';
import 'package:flutter/material.dart';

import 'bored/api_bored1.dart';
import 'bored/api_bored2.dart';
import 'catfact/ara_api1.dart';
import 'catfact/ara_api2.dart';
import 'gtsuvai/item_3.dart';
import 'gtsuvai/offer_1_.dart';
import 'gtsuvai/resut_2.dart';


class api_bottomnavi extends StatefulWidget {
  const api_bottomnavi({super.key});

  @override
  State<api_bottomnavi> createState() => _api_bottomnaviState();
}

class _api_bottomnaviState extends State<api_bottomnavi> {

  int _currentIndex = 0;

  final tabs = [
    offerlink(),
    resut(),
    iteam(),




  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          iconSize: 30,
          selectedFontSize: 15,
          // unselectedFontSize: 50,
          items: [

            ///offer


            BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
                color: Colors.black,
                size: 25,),
              label: "offer",
              backgroundColor: Colors.teal,
            ),


            ///resut


            BottomNavigationBarItem(
              icon: Icon(
                Icons.money,
                color: Colors.black,
                size: 25,),
              label: "resut",
              backgroundColor: Colors.blueGrey,
            ),


            ///item


            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Colors.black,
                size: 25,),
              label: "item",
              backgroundColor: Colors.blueGrey,
            ),

          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }
      ),

    );
  }
}