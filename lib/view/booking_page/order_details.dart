import 'package:flutter/material.dart';

class orderdetails extends StatefulWidget {
  const orderdetails({super.key});

  @override
  State<orderdetails> createState() => _orderdetailsState();
}

class _orderdetailsState extends State<orderdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("order ID- 00000"),
    actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.menu),),],),
      body: Column(
        children: [
          Container(height: 400,width: double.infinity,color: Colors.black,),
         BottomSheet(onClosing:() {
           
         }, builder: (context) {return PopupMenuItem(child: Container());}),
        ],
      ),
    );
    // showModalBottomSheet(context: context, builder: (context) {
    //   return Container(height: 300,color:Colors.amber ,);
    // },);
  }
}