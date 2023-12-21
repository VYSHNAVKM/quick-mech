import 'package:flutter/material.dart';

class CategoryWiseWorkerscreen extends StatelessWidget {
  const CategoryWiseWorkerscreen({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryName.toString()),
        ),
        body: Text('hi'));
  }
}
