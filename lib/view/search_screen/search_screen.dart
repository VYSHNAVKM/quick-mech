import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickmech/controller/mechanic_controller/mechanic_controller.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/utils/textstyle_constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final provider = Provider.of<MechanicController>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            height: 50,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search for mechanics,location,categories...',
                    hintStyle: TextStyle(
                        fontSize: 20, color: ColorConstants.systemGrey)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Recent Searches',
            style: TextStyleConstants.heading3,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: (1 / 1.5)),
          itemCount: 5,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorConstants.secondaryWhite,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                provider.mechanicList[1].image.toString(),
                              ),
                              fit: BoxFit.fitWidth)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: width * 0.2,
                              child: Text(
                                provider.mechanicList[1].name.toString(),
                                style: TextStyleConstants.heading5,
                                maxLines: 1,
                              )),
                          Container(
                            width: 40,
                            height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorConstants.bannerColor),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Provider.of<MechanicController>(context)
                                            .mechanicList[0]
                                            .rating ??
                                        '',
                                    style: TextStyle(
                                        color: ColorConstants.primaryWhite),
                                  ),
                                  Icon(Icons.star,
                                      size: 12,
                                      color: ColorConstants.primaryWhite)
                                ]),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(provider.mechanicList[1].category.toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                          provider.mechanicList[1].currentLocation.toString()),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: provider.mechanicList[1].status == 'online'
                            ? Text(
                                'Available for work now',
                                style: TextStyle(color: Colors.green),
                              )
                            : provider.mechanicList[1].status == 'engaged'
                                ? Text(
                                    'Engaged',
                                    style: TextStyle(color: Colors.amber),
                                  )
                                : Text(
                                    'Offline',
                                    style: TextStyle(color: Colors.red),
                                  ))
                  ]),
            ),
          ),
        )
      ]),
    );
  }
}
