import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:news_app/screens/home_screen.dart';

import '../screens/auth/login_screen.dart';

void navigateTo(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );
void navigateToReplacement(context, Widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );
void showToast({
  required String text,
  required Color color,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 8,
      backgroundColor: Color(0xffeaeaea),
      textColor: color,
      fontSize: 16.0,
    );
Widget start() {
  if (FirebaseAuth.instance.currentUser != null) {
    return  HomeScreen();
  } else {
    return const LoginScreen();
  }
}




validInput(String value, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "Not valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "Not valid email";
    }
  }
  if (type == "number") {
    if (!GetUtils.isNumericOnly(value)) {
      return "Not valid Input enter numbers only";
    }
  }
  if (value.isEmpty) {
    return "can't be Empty!";
  }
  if (value.length < min) {
    return "can't be less than $min";
  }
  if (value.length > max) {
    return "can't be larger than $max";
  }
}
