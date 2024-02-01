import 'package:aravinth_api/public/public_1.dart';
import 'package:flutter/material.dart';

import 'bored/api_bored1.dart';
import 'bored/api_bored2.dart';
import 'catfact/ara_api1.dart';
import 'catfact/ara_api2.dart';
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

            ///link 1


            BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
                color: Colors.black,
                size: 25,),
              label: "link 1",
              backgroundColor: Colors.teal,
            ),


            ///link 2


            BottomNavigationBarItem(
              icon: Icon(
                Icons.money,
                color: Colors.black,
                size: 25,),
              label: "link 2",
              backgroundColor: Colors.blueGrey,
            ),


            ///link 3


            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Colors.black,
                size: 25,),
              label: "link 3",
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