import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

import 'package:http/http.dart' as http;

class client extends StatefulWidget {
  const client({super.key});

  @override
  State<client> createState() => _clientState();
}

class _clientState extends State<client> {


  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController gst = TextEditingController();
  final TextEditingController website = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController contactPerson = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();

  
  Future<bool>? _success;
  Future<bool> details(
      String name,
      String phone, 
      String address, 
      String gst, 
      String website, 
      String email, 
      String contactPerson, 
      String phoneNumber, 
      ) 
  async {

    var result = await http.post(Uri.parse("http://catodotest.elevadosoftwares.com/Client/InsertClient"),
        headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic> {
        "clientId":0,
          "clientName":name,
          "phone":phone,
          "address":address,
          "gst":gst,
          "website":website,
          "email":email,
          "contactPerson":contactPerson,
          "phoneNumber":phoneNumber,
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
        title: Text("Api For Client",
        style: TextStyle(fontSize: 25,color: Colors.blue),),
      ),

      body: Column(
        children: [
          Container(
            child: ( _success == null ) ? buildColumn() : buildFutureBuild()
          ),
        ],
      ),
    );
  }




  SingleChildScrollView buildColumn(){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: name,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: "Name",
                  prefixIcon: Icon(Icons.perm_identity_sharp)
              ),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: phone,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: "Phone",
                  prefixIcon: Icon(Icons.perm_identity_sharp)
              ),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: address,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: "=Address",
                  prefixIcon: Icon(Icons.perm_identity_sharp)
              ),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: gst,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: "Gst",
                  prefixIcon: Icon(Icons.perm_identity_sharp)
              ),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: website,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: "Website",
                  prefixIcon: Icon(Icons.perm_identity_sharp)
              ),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: email,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: "Email",
                  prefixIcon: Icon(Icons.perm_identity_sharp)
              ),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: contactPerson,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: "Contactperson",
                  prefixIcon: Icon(Icons.perm_identity_sharp)
              ),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: phoneNumber,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: "PhoneNumber",
                  prefixIcon: Icon(Icons.perm_identity_sharp)
              ),
            ),
          ),
          SizedBox(height: 30,),

          ElevatedButton(
              onPressed: (){
                setState(() {
                  _success = details (
                    name.text,
                   phone.text,
                  address.text,
                     gst.text,
                 website.text,
                   email.text,
                    contactPerson.text,
                     phoneNumber.text,
                  );
                });
              },
              child: Text("Login",
          style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }





FutureBuilder buildFutureBuild(){
    return FutureBuilder(
        future: _success,
        builder: (context, snapshot) {
          if (snapshot.hasData ) {
            return Text(snapshot.data!.toString());
          }
          else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Welcome",
            style: TextStyle(
                fontSize: 25,
                color: Colors.blue),
          ),
        ],
      );
    }
    );
}



}
