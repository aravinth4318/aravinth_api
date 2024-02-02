// import 'dart:convert';
//
// import 'package:aravinth_api/get_abi/public/public_2_model.dart';
// import 'package:aravinth_api/get_abi/public/public_model_class.dart';
// import 'package:flutter/material.dart';
// import 'package:matcher/matcher.dart';
//
// import 'package:http/http.dart' as http;
//
// class public extends StatefulWidget {
//   const public({super.key});
//
//   @override
//   State<public> createState() => _publicState();
// }
//
// class _publicState extends State<public> {
//
//   ///this is bored detail for uri
//
//
//   Future <pub>? _future;
//   Future <List<Entries>> details() async {
//     var res = await http.get(Uri.parse("https://api.publicapis.org/entries"));
//     var data = jsonDecode(res.body)["entries"];
//
//   }
//
// //   Future<pub>? _future;
// //   Future <List<Entries>>   fetchdetails() async {
// //   var result = await http.get(Uri.parse("https://api.publicapis.org/entries"));
// //   var data = jsonDecode(result.body) ["entries"];
// //   return (data as List).map((obj) => Entries.fromJson(obj)).toList();
// // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text("Api For Public",
//           style: TextStyle(fontSize: 25),),
//         ),
//       ),
//
//
//       body: SingleChildScrollView(
//         child: Center(
//           child: FutureBuilder<List<Entries>> (future: fetchdetails(),
//             builder: (BuildContext context, snapshot) {
//             if(snapshot.hasData) {
//               List<Entries> enteryList = snapshot.data!;
//               return Column(
//                 children: [
//                   Container(
//                     height: 700,
//                     child: ListView.builder(
//                       itemCount: enteryList.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return ListTile(
//                             leading: Icon(Icons.list),
//                             title: Center(
//                                 child: Text(enteryList[index].aPI.toString())),
//                             trailing: Text("Public Api",
//                             style: TextStyle(fontSize: 10),
//                             ),
//                           );
//                         }
//                     ),
//                   )
//                 ],
//               );
//             }
//
//             ///show the any sever error 1st one for error function
//
//
//             else if (snapshot.hasError)  {
//               return Text("${snapshot.error}");
//             }
//
//             /// By default, show a loading spinner.
//
//             return CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
