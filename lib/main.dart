import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'helpers/constants.dart';

void main() => runApp(MovEApp());

class MovEApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData.dark(),
      home: LoginPage(),
    );
  }

}


