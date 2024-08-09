import 'package:flutter/material.dart';

class CustomTextSign extends StatelessWidget {
  final String text;
  final String sign;
  final void Function()? onTap;
  const CustomTextSign({
    super.key,
    required this.text,
    required this.sign,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              sign,
              style: const TextStyle(
                  color: Color(0xff0081ea),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
