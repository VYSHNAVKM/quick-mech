import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://i.pinimg.com/564x/ae/5c/d8/ae5cd8de43e94808d0c52f67bdef7b90.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
