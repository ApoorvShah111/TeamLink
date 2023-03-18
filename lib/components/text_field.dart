import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget{
  final controller;
  final String hintText;
  final bool obscureText;

  const InputTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(/*0xff606c38*/ 0xffb2b2b2)),
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(/*0xff283618*/ 0xffb2b2b2)),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[500])
          ),
          style: const TextStyle(
            color: Color(0xff1f1f1f),
            fontFamily: 'Roboto-Light',
            fontSize: 16
          ),
        )
    );
  }
}

