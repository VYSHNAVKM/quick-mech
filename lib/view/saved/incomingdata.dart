import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';

class Saveddata extends StatefulWidget {
  const Saveddata({super.key});

  @override
  State<Saveddata> createState() => _SaveddataState();
}

class _SaveddataState extends State<Saveddata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SAVED",style: TextStyle(
            fontSize: 25,color: Colors.black),
            ),forceMaterialTransparency: true,
            ),
      body:
       GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3),
        itemCount: 15,
        itemBuilder: (context, index) {
        return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstants.bannerColor),
                    child: Column(
                      children: 
                      [
                        Icon(Icons.person)],
                    ),
                  ),
                );
      }, ),
      
    );
  }
}