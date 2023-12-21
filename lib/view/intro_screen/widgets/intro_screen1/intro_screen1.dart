import 'package:flutter/material.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/564x/a2/30/8e/a2308e2ec6d7660a3916315dc00aa682.jpg"),
              fit: BoxFit.cover)),
    );
  }
}
