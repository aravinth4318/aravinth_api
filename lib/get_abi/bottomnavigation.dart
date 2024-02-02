import 'package:aravinth_api/get_abi/public/public_1.dart';
import 'package:flutter/material.dart';

import 'bored/api_bored1.dart';
import 'catfact/ara_api1.dart';


class api_bottomnavi extends StatefulWidget {
  const api_bottomnavi({super.key});

  @override
  State<api_bottomnavi> createState() => _api_bottomnaviState();
}

class _api_bottomnaviState extends State<api_bottomnavi> {

  int _currentIndex = 0;

  final tabs = [
    ap_catfact(),
    api_bored1(),
    // public(),



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

            ///catfact 1


            BottomNavigationBarItem(
              icon: Icon(
                Icons.calculate,
                color: Colors.black,
                size: 25,),
              label: "catfact ",
              backgroundColor: Colors.teal,
            ),


            ///bored 1


            BottomNavigationBarItem(
              icon: Icon(
                Icons.money,
                color: Colors.black,
                size: 25,),
              label: "bored ",
              backgroundColor: Colors.blueGrey,
            ),


            ///public 1


            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Colors.black,
                size: 25,),
              label: "public ",
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