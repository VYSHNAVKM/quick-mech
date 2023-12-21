import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/utils/database/user_db.dart';
import 'package:quickmech/utils/textstyle_constants.dart';
import 'package:quickmech/view/Edit_profile/edit_profile.dart';
import 'package:quickmech/view/login_screen/login_screen.dart';
import 'package:quickmech/view/profile_screen/screens/about_us_screen/about_us_screen.dart';
import 'package:quickmech/view/profile_screen/screens/contact%20_support_screen/contact%20_support_screen.dart';
import 'package:quickmech/view/profile_screen/screens/terms_and_conditions_screen/terms_and_conditions_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: ColorConstants.bannerColor,
                    backgroundImage: AssetImage(userData[0].image.toString()),
                  ),
                  Positioned(
                      bottom: -1,
                      right: -1,
                      child: CircleAvatar(
                        radius: 19,
                        backgroundColor: ColorConstants.primaryWhite,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: ColorConstants.bannerColor,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => edit_profile(),
                              ));
                            },
                            child: Icon(
                              Icons.edit,
                              size: 20,
                              color: ColorConstants.primaryBlack,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                userData[0].name.toString(),
                style: TextStyleConstants.heading3,
              ),
              Text(
                userData[0].mobile.toString(),
                style: TextStyleConstants.heading3,
              ),
              Text(
                userData[0].email.toString(),
                style: TextStyleConstants.heading3,
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: ColorConstants.bannerColor,
                  child: Column(
                    children: [
                      ListTile(
                          leading: Icon(
                            Icons.messenger_outline_rounded,
                            color: ColorConstants.primaryBlack,
                          ),
                          title: Text(
                            'Messages',
                            style: TextStyleConstants.heading3,
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: ColorConstants.primaryBlack,
                            ),
                          )),
                      Divider(
                        thickness: 2,
                        color: ColorConstants.primaryWhite,
                      ),
                      ListTile(
                          leading: Icon(
                            Icons.account_balance_wallet_rounded,
                            color: ColorConstants.primaryBlack,
                          ),
                          title: Text(
                            'Account points',
                            style: TextStyleConstants.heading3,
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: ColorConstants.primaryBlack,
                            ),
                          )),
                      Divider(
                        thickness: 2,
                        color: ColorConstants.primaryWhite,
                      ),
                      ListTile(
                          leading: Icon(
                            Icons.description_outlined,
                            color: ColorConstants.primaryBlack,
                          ),
                          title: Text(
                            'Terms and conditions',
                            style: TextStyleConstants.heading3,
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    TermsAndConditionsScreen(),
                              ));
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: ColorConstants.primaryBlack,
                            ),
                          )),
                      Divider(
                        thickness: 2,
                        color: ColorConstants.primaryWhite,
                      ),
                      ListTile(
                          leading: Icon(
                            Icons.contact_support_outlined,
                            color: ColorConstants.primaryBlack,
                          ),
                          title: Text(
                            'Contact support',
                            style: TextStyleConstants.heading3,
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ContactSupportScreen(),
                              ));
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: ColorConstants.primaryBlack,
                            ),
                          )),
                      Divider(
                        thickness: 2,
                        color: ColorConstants.primaryWhite,
                      ),
                      ListTile(
                          leading: Icon(
                            Icons.info_outline,
                            color: ColorConstants.primaryBlack,
                          ),
                          title: Text(
                            'About us',
                            style: TextStyleConstants.heading3,
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AboutUsScreen(),
                              ));
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: ColorConstants.primaryBlack,
                            ),
                          )),
                      Divider(
                        thickness: 2,
                        color: ColorConstants.primaryWhite,
                      ),
                      ListTile(
                          leading: Icon(
                            Icons.info_outline,
                            color: ColorConstants.primaryBlack,
                          ),
                          title: Text(
                            'Logout',
                            style: TextStyleConstants.heading3,
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('LOGOUT!'),
                                    content:
                                        const Text('Do you want to logout ?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen(),
                                              ),
                                              (route) => false);
                                        },
                                        child: const Text('YES'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text('NO'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: ColorConstants.primaryBlack,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
