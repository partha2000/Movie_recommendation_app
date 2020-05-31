import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'helpers/constants.dart';
import "details.dart";

void main() => runApp(MovEApp());

class MovEApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primaryColor: appDarkGreyColor,
      ),
      home: LoginPage(),
    );
  }
}
