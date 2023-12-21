import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickmech/controller/fav_controller/fav_controller.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/utils/textstyle_constants.dart';

class saved extends StatefulWidget {
  const saved({super.key});

  @override
  State<saved> createState() => _savedState();
}

class _savedState extends State<saved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text(
          "SAVED",
          style: TextStyleConstants.heading3,
        ),
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorConstants.secondaryWhite,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorConstants.systemGrey,
                      ),
                      hintText: 'Search in your saved mechanics',
                      hintStyle: TextStyle(color: ColorConstants.systemGrey)),
                ),
              ),
            ),
          ),
          CustomFavlist(),
        ],
      ),
    );
  }
}

class CustomFavlist extends StatelessWidget {
  const CustomFavlist({super.key});

  @override
  Widget build(BuildContext context) {
    var favoiuritepage = context.watch<FavouriterController>();
    return Expanded(
      child: ListView.builder(
        itemCount: favoiuritepage.favitems.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
                color: ColorConstants.secondaryWhite,
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(favoiuritepage.favitems[index].name.toString()),
              leading: Container(
                width: 100,
                height: 100,
                child: Image.network(favoiuritepage.favitems[index].image),
              ),
              subtitle: Column(
                children: [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
