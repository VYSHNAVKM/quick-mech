import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://i.pinimg.com/564x/a2/30/8e/a2308e2ec6d7660a3916315dc00aa682.jpg"),fit: BoxFit.cover)),
      
         child: Center(
           child: AnimatedTextKit(
             animatedTexts: [
               WavyAnimatedText('Wanna find a mechanic????',textStyle: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 30))
               ],
               isRepeatingAnimation: true,
                 ),
         ),
        
      );
    
  }
}
