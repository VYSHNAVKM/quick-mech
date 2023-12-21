import 'package:flutter/material.dart';
//import 'package:quickmech/utils/color_constants.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ACTIVITY",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          forceMaterialTransparency: true,
        ),
        body: Column(
          children: [
            ListTile(leading: Text("Past",),trailing: IconButton(onPressed: () {
              
            }, icon:Icon(Icons.info),),),
            ListTile(leading: Text("You don't have any recent activity"),),
            ListTile(leading: IconButton(onPressed: () {}, 
            icon:Icon(Icons.schedule),),title:  Text("View older activity"),trailing:IconButton(onPressed: () {
              
            }, icon:Icon(Icons.arrow_forward_ios_rounded)) ,),
          ],
        ),
        
        );
  }
}
