import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quickmech/controller/mechanic_controller/mechanic_controller.dart';
import 'package:quickmech/controller/mechanic_profile_controller/mechanic_profile_controller.dart';

import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/utils/textstyle_constants.dart';
import 'package:quickmech/view/booking_page/booking_page.dart';

class MechanicProfile extends StatefulWidget {
  const MechanicProfile({super.key, required this.index});
  final int index;
  @override
  State<MechanicProfile> createState() => _MechanicProfileState();
}

class _MechanicProfileState extends State<MechanicProfile> {
  @override
  void initState() {
    Provider.of<MechanicProfileController>(context, listen: false)
        .determinePosition();
    Provider.of<MechanicController>(context, listen: false).getMechanic();
    Provider.of<MechanicProfileController>(context, listen: false)
        .getDistanceBetween(
            Provider.of<MechanicController>(context, listen: false)
                .mechanicList[0]);
    super.initState();
  }

  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<MechanicProfileController>(context, listen: false);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * .35,
            pinned: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn1.vectorstock.com/i/1000x1000/23/70/man-avatar-icon-flat-vector-19152370.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                titlePadding: EdgeInsets.all(0),
                title: Container(
                  height: 60,
                  width: double.infinity,
                  color: const Color.fromARGB(181, 0, 0, 0),
                  child: ListTile(
                    title: Text(
                      Provider.of<MechanicController>(context)
                              .mechanicList[0]
                              .name ??
                          '',
                      style: GoogleFonts.robotoSlab(
                          color: ColorConstants.primaryWhite, fontSize: 18),
                    ),
                    subtitle: Text(
                      '${Provider.of<MechanicProfileController>(context).roundDistanceInKM} km away',
                      style: TextStyle(
                          color: ColorConstants.systemGrey, fontSize: 12),
                    ),
                    trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                      size: 14,
                                      color: ColorConstants.primaryWhite)
                                ]),
                          )
                        ]),
                  ),
                )),
          ),
          SliverList.list(children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      color: ColorConstants.systemGrey,
                      width: double.infinity,
                      height: 80,
                      child: Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.location_on,
                            size: 30,
                            color: ColorConstants.bannerColor,
                          ),
                          title: Text(
                            Provider.of<MechanicController>(context)
                                    .mechanicList[0]
                                    .location ??
                                '',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          trailing: Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Icon(
                                    Icons.share,
                                    size: 26,
                                    color: ColorConstants.bannerColor,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Icon(
                                    Icons.bookmark,
                                    size: 30,
                                    color: ColorConstants.bannerColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            // Category
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 20,
                                    child: Center(
                                        child: Icon(
                                      Icons.category,
                                      color: ColorConstants.primaryWhite,
                                    )),
                                  ),
                                  title: Text(
                                    'Category',
                                    style: TextStyleConstants.heading5,
                                  ),
                                  subtitle: Text('2 wheeler')),
                            ),
                            // Age
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 20,
                                    child: Center(
                                        child: Icon(
                                      Icons.man,
                                      color: ColorConstants.primaryWhite,
                                    )),
                                  ),
                                  title: Text(
                                    'Age',
                                    style: TextStyleConstants.heading5,
                                  ),
                                  subtitle: Text(
                                      Provider.of<MechanicController>(context)
                                              .mechanicList[0]
                                              .age ??
                                          '')),
                            ),
                            // Lives in
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 20,
                                    child: Center(
                                        child: Icon(
                                      Icons.house,
                                      color: ColorConstants.primaryWhite,
                                    )),
                                  ),
                                  title: Text(
                                    'Lives In',
                                    style: TextStyleConstants.heading5,
                                  ),
                                  subtitle: Text(
                                      Provider.of<MechanicController>(context)
                                              .mechanicList[0]
                                              .location ??
                                          '')),
                            ),
                            // Contact details
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 20,
                                    child: Center(
                                        child: Icon(
                                      Icons.phone,
                                      color: ColorConstants.primaryWhite,
                                    )),
                                  ),
                                  title: Text(
                                    'Contact Details',
                                    style: TextStyleConstants.heading5,
                                  ),
                                  subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            provider.launchWhatsapp(
                                              number: 7558095349,
                                              name: 'Abhishek',
                                            );
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                border: Border.all(),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.whatsapp,
                                                    size: 16,
                                                    color: ColorConstants
                                                        .primaryBlack,
                                                  ),
                                                  Text(
                                                    'WhatsApp',
                                                    style: TextStyle(
                                                        color: ColorConstants
                                                            .primaryBlack),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            provider.callMechanic();
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                border: Border.all(),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons.phone,
                                                    size: 14,
                                                    color: ColorConstants
                                                        .primaryBlack,
                                                  ),
                                                  Text('Call Now',
                                                      style: TextStyle(
                                                          color: ColorConstants
                                                              .primaryBlack))
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  // Description
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Description',
                            style: TextStyleConstants.heading3),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                              style: TextStyle(fontSize: 16, height: 2),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ColorConstants.systemGrey,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                              color: ColorConstants.bannerColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Icon(
                                  Icons.chat,
                                  color: ColorConstants.primaryWhite,
                                  size: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  'Chat',
                                  style: TextStyle(
                                      color: ColorConstants.primaryWhite,
                                      fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookingPage()));
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                                color: ColorConstants.bannerColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              'Book',
                              style: TextStyle(
                                  color: ColorConstants.primaryWhite,
                                  fontSize: 16),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),

                  // Reviews
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Text('Reviews', style: TextStyleConstants.heading3),
                      ),
                    ],
                  ),
                  Provider.of<MechanicController>(context)
                              .mechanicList[widget.index]
                              .reviews
                              ?.length ==
                          0
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  'No reviews yet. Be the first one to write for ${Provider.of<MechanicController>(context).mechanicList[widget.index].name}',
                                  style: TextStyle(
                                      color: ColorConstants.primaryBlack),
                                ),
                              )
                            ],
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: Provider.of<MechanicController>(context)
                              .mechanicList[widget.index]
                              .reviews
                              ?.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 10,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                width: double.infinity,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        leading: CircleAvatar(
                                          radius: 15,
                                        ),
                                        title: Text(
                                          Provider.of<MechanicController>(
                                                      context)
                                                  .mechanicList[widget.index]
                                                  .reviews?[index]
                                                  .name ??
                                              '',
                                          style: TextStyle(
                                              color:
                                                  ColorConstants.primaryBlack,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Row(children: [
                                          PannableRatingBar(
                                            rate: Provider.of<
                                                            MechanicController>(
                                                        context)
                                                    .mechanicList[widget.index]
                                                    .reviews?[index]
                                                    .rated ??
                                                0,
                                            items: List.generate(
                                                5,
                                                (index) => RatingWidget(
                                                      selectedColor:
                                                          ColorConstants
                                                              .bannerColor,
                                                      unSelectedColor:
                                                          Colors.grey,
                                                      child: Icon(
                                                        Icons.star,
                                                        size: 14,
                                                      ),
                                                    )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                                '${Provider.of<MechanicController>(context).mechanicList[widget.index].reviews?[index].dateTime}'),
                                          )
                                        ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          child: Text(
                                            Provider.of<MechanicController>(
                                                        context)
                                                    .mechanicList[widget.index]
                                                    .reviews?[index]
                                                    .content ??
                                                '',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        ),
                  // Give feedback
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Write Reviews...',
                                    border: InputBorder.none),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PannableRatingBar(
                                  rate: rating,
                                  items: List.generate(
                                      5,
                                      (index) => RatingWidget(
                                            selectedColor:
                                                ColorConstants.bannerColor,
                                            unSelectedColor: Colors.grey,
                                            child: Icon(
                                              Icons.star,
                                              size: 40,
                                            ),
                                          )),
                                  onChanged: (value) {
                                    // the rating value is updated on tap or drag.
                                    setState(() {
                                      rating = value;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                          color: ColorConstants.bannerColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        'Submit',
                                        style: TextStyle(
                                            color: ColorConstants.primaryWhite),
                                      )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
