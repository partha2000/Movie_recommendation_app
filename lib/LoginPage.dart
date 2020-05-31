// import 'dart:js';

import 'package:flutter/material.dart';
import 'helpers/constants.dart';
import 'appHome.dart';


class LoginPage extends StatelessWidget {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final bool _alreadyLoggedIn = false;

  void apphome(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => HorizontalScrollList(),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    
    final logo = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: bigRadius,
      child: appLogo,
    );

    final username = TextFormField(
      controller: _usernameController,
      keyboardType: TextInputType.emailAddress,
      // maxLength: 14,
      maxLines: 1,
      autofocus: true,
      style: TextStyle(
        color: Colors.white
      ),
      decoration: InputDecoration(
        hintText: usernameHintText,
        fillColor: Colors.grey[850],
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          // borderSide: BorderSide(
          //           color: Colors.blue,
          //         ),
        ),
        hintStyle: TextStyle(
          color: Colors.grey[400],
        )
      ),
    );

    final password = TextFormField(
      controller: _passwordController,
      keyboardType: TextInputType.text,
      // maxLength: 14,
      obscureText: true,
      maxLines: 1,
      style: TextStyle(
        color: Colors.white
      ),
      decoration: InputDecoration(
        hintText: passwordHintText,
        fillColor: Colors.grey[850],
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        hintStyle: TextStyle(
          color: Colors.grey[400],
        )
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
        ),
        onPressed: () => apphome(context),
        padding: EdgeInsets.all(12),
        color: Colors.purpleAccent[400],
        child: Text(loginButtonText, style: TextStyle(color: Colors.white)),
      ),
    );


    return Scaffold(
      backgroundColor: appDarkGreyColor,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: bigRadius),
            username,
            SizedBox(height: bigRadius),
            password,
            SizedBox(height: buttonHeight),
            loginButton
          ],
        ),
      ),
    );
  }

}