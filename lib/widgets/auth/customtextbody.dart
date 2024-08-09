import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String textitle;
  final String textbody;
  const CustomTextBodyAuth({
    super.key,
    required this.textitle,
    required this.textbody,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          textitle,
          style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 129, 234)),
        ),
        const SizedBox(height: 30),
        Text(
          textbody,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
