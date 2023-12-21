import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quickmech/controller/mechanic_profile_controller/mechanic_profile_controller.dart';
import 'package:quickmech/utils/color_constants.dart';

class ContactSupportScreen extends StatefulWidget {
  const ContactSupportScreen({super.key});

  @override
  State<ContactSupportScreen> createState() => _ContactSupportScreenState();
}

class _ContactSupportScreenState extends State<ContactSupportScreen> {
  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<MechanicProfileController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.bannerColor,
        centerTitle: true,
        title: Text('ContactSupport'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: ColorConstants.primaryWhite,
                    borderRadius: BorderRadius.circular(20)),
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: ColorConstants.bannerColor,
                          child: Icon(
                            Icons.call,
                            color: ColorConstants.primaryWhite,
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Our 24X7 Customer Service',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.callCustomerService();
                            },
                            child: Container(
                              height: 40,
                              width: 110,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 3),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.phone,
                                      size: 14,
                                      color: ColorConstants.primaryBlack,
                                    ),
                                    Text('Call Now',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorConstants.primaryBlack))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: ColorConstants.primaryWhite,
                    borderRadius: BorderRadius.circular(20)),
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: ColorConstants.bannerColor,
                          child: Icon(
                            Icons.email,
                            color: ColorConstants.primaryWhite,
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Write us at',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 110,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 3),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.email),
                                    Text('Write Now',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ColorConstants.primaryBlack))
                                  ],
                                ),
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
          ],
        ),
      ),
    );
  }
}
