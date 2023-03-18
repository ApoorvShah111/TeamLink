import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  // The function required to callback
  final Function()? OnTap;

  const CustomButton({
    super.key,
    required this.OnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.symmetric(horizontal: 35),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(35)
      ),
      child: const Center(
        child: Text(
          "Sign In",
          style: TextStyle(
              color: Color(0xffffffff),
              fontFamily: 'Roboto-Dark',
              fontSize: 16
          )
        )
      )
    );
  }
}