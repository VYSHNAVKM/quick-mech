import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HISTORY",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          ListTile(
            leading: Text(
              "Past",
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.info),
            ),
          ),
          ListTile(
            leading: Text("You don't have any recent history"),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.schedule),
            ),
            title: Text("View older history"),
            trailing: IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_rounded)),
          ),
        ],
      ),
    );
  }
}
