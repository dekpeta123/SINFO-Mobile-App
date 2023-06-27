import 'package:sinfo/pages/first_screen.dart';
import 'package:sinfo/services/api_service.dart';
import 'package:flutter/material.dart';
import 'components/customListTile.dart';
import 'model/article_model.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

String username = '';

String nama = '';
String pass = '';
String id_user = '';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: firstScreen(),
    );
  }
}
