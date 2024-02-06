import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';


import 'package:http/http.dart' as http;


class employee extends StatefulWidget {
  const employee({super.key});

  @override
  State<employee> createState() => _employeeState();
}

class _employeeState extends State<employee> {

  final TextEditingController id = TextEditingController();
  final TextEditingController empname = TextEditingController();
  final TextEditingController mob = TextEditingController();
  final TextEditingController user = TextEditingController();
  final TextEditingController paswd = TextEditingController();
  final TextEditingController conpass = TextEditingController();


  ///this code for uri details

  Future<bool>? _success;
  Future<bool> empdetails(
      String id, 
      String empname, 
      String mob, 
      String user, 
      String paswd,
      String conpass
      ) async {
    var result = await http.post(
        Uri.parse("http://catodotest.elevadosoftwares.com/Employee/InsertEmployee"),
            headers:  <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic> {
      "employeeId":id,
      "employeeName":empname,
      "mobile":mob,
      "userName":user,
      "password":paswd,
      "confirmPassword":conpass,
      "createdBy":1
    }
    )
    );

    return jsonDecode(result.body) ["success"];
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Post Api",
          style: TextStyle(fontSize: 25),),
        ),
      ),


      body: Column(
        children: [
          Container(
            child: (_success == null) ? buildColumn() : buildFutureBuilder()
          ),
        ],
      ),
    );
  }




  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextFormField(
          controller: id,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Id Number",
            prefixIcon: Icon(Icons.perm_identity_sharp)
          ),
        ),
        SizedBox(height: 30,),
        TextFormField(
          controller: empname,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: "Enter Your Name",
            prefixIcon: Icon(Icons.person)
          ),
        ),

        SizedBox(height: 30,),

        TextFormField(
          controller: mob,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: "Number",
            prefixIcon: Icon(Icons.phone)
          ),
        ),

        SizedBox(height: 30,),

        TextFormField(
          controller: user,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              labelText: "Position",
          ),
        ),

        SizedBox(height: 30,),

        TextFormField(
          controller: paswd,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: "Password"
          ),
        ),

        SizedBox(height: 30,),

        TextFormField(
          controller: conpass,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: "ConfirmPassword ",
          ),
        ),

        SizedBox(height: 30,),

        ElevatedButton(
            onPressed: (){
              setState(() {
                _success = empdetails(
                  id.text,
                    empname.text,
                    mob.text,
                    user.text,
                    paswd.text,
                    conpass.text

                );
              });
            },
            child: Text("Add Data"))
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: Text("Welcome To Our Employees",
              style: TextStyle(fontSize: 25),
              ),
              ),
            ],
          );
        }
    );
  }








}
