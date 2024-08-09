import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final TextEditingController? mycontroller;
  final String? Function(String?)? validate;
  final TextInputType? keyboardType;
  final IconButton? suffix;
  bool isPassword;
  CustomTextFormAuth(
      {super.key,
      required this.hinttext,
      required this.labeltext,
      this.mycontroller,
      this.validate,
      this.keyboardType,
      this.suffix,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        obscureText: isPassword,
        keyboardType: keyboardType,
        validator: validate,
        cursorColor: Colors.black,
        style: const TextStyle(fontSize: 18, color: Colors.black),
        controller: mycontroller,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Color(0xff0081ea))),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelStyle: const TextStyle(
              color: Color(0xff0081ea),
              fontSize: 25,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(labeltext)),
            hintText: hinttext,
            suffixIcon: suffix,
            labelStyle:
                const TextStyle(fontSize: 22, color: const Color(0xff0081ea)),
            hintStyle: const TextStyle(fontSize: 14)),
      ),
    );
  }
}
