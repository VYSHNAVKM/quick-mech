import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://i.pinimg.com/564x/25/a1/a7/25a1a7b04e24516b1e0f4d7f73088217.jpg"),
          fit: BoxFit.cover,
          ),
          ),
      child: Center(
        child: AnimatedTextKit(
          animatedTexts: [
        WavyAnimatedText('Lets start the App',textStyle: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold)),
        
          ],
          isRepeatingAnimation: true,
        ),
      ),
    );
  }
}