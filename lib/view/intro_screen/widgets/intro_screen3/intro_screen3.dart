import 'package:flutter/material.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://i.pinimg.com/564x/25/a1/a7/25a1a7b04e24516b1e0f4d7f73088217.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
