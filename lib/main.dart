import 'package:aravinth_api/post_api/category/category_post.dart';
import 'package:flutter/material.dart';

import 'get_abi/bored/api_bored1.dart';
import 'get_abi/bored/api_bored2.dart';
import 'get_abi/bottomnavigation.dart';
import 'get_abi/catfact/ara_api1.dart';
import 'get_abi/catfact/ara_api2.dart';
import 'get_abi/gtbottom.dart';
import 'get_abi/gtsuvai/item_3.dart';
import 'get_abi/gtsuvai/offer_1_.dart';
import 'get_abi/gtsuvai/resut_2.dart';
import 'get_abi/nationalize/natio_1.dart';
import 'get_abi/public/public_1.dart';
import 'get_abi/public/public_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: catpost (),
    );
  }
}
