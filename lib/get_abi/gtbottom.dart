import 'package:flutter/material.dart';

import 'gtsuvai/item_3.dart';
import 'gtsuvai/offer_1_.dart';
import 'gtsuvai/resut_2.dart';


class gtsuvai_bottom extends StatefulWidget {
  const gtsuvai_bottom({super.key});

  @override
  State<gtsuvai_bottom> createState() => _gtsuvai_bottomState();
}

class _gtsuvai_bottomState extends State<gtsuvai_bottom> {

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