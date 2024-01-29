import 'package:flutter/material.dart';

import 'bored/api_bored1.dart';
import 'bored/api_bored2.dart';
import 'catfact/ara_api1.dart';
import 'catfact/ara_api2.dart';


class calcbottomnavi extends StatefulWidget {
  const calcbottomnavi({super.key});

  @override
  State<calcbottomnavi> createState() => _calcbottomnaviState();
}

class _calcbottomnaviState extends State<calcbottomnavi> {

  int _currentIndex = 0;

  final tabs = [
    ap_catfact(),
    api_catfact2(),
    api_bored1(),
    bored2(),


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
              label: "catfact 1",
              backgroundColor: Colors.teal,
            ),


            ///catfact 2

            BottomNavigationBarItem(
              icon: Icon(
                Icons.maximize,
                color: Colors.black,
                size: 25,),
              label: "catfact 2",
              backgroundColor: Colors.green,
            ),

            ///bored 1

            BottomNavigationBarItem(
              icon: Icon(
                Icons.money,
                color: Colors.black,
                size: 25,),
              label: "bored 1",
              backgroundColor: Colors.blueGrey,
            ),


            ///bored 2

            BottomNavigationBarItem(
              icon: Icon(
                Icons.monetization_on_rounded,
                color: Colors.black,
                size: 25,),
              label: "bored 2",
              backgroundColor: Colors.purpleAccent,
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