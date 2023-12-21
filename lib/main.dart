import 'package:flutter/material.dart';
import 'package:quickmech/controller/fav_controller/fav_controller.dart';
import 'package:quickmech/controller/mechanic_controller/mechanic_controller.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:provider/provider.dart';
import 'package:quickmech/controller/booking_page_controller/booking_page_controller.dart';
import 'package:quickmech/controller/mechanic_profile_controller/mechanic_profile_controller.dart';
import 'package:quickmech/utils/database/database_for%20_favourite.dart';
import 'package:quickmech/view/bottom_navigation_bar/bottom_navigation_bar.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MechanicController(),
        ),
        ChangeNotifierProvider(
          create: (context) => MechanicProfileController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingPageController(),
        ),
        Provider(create: (context) => FavouriteModel()),
        ChangeNotifierProxyProvider<FavouriteModel, FavouriterController>(
            create: (context) => FavouriterController(),
            update: ((context, CustomFavlist, favoiuritepage) {
              if (favoiuritepage == null)
                throw ArgumentError.notNull('favoiuritepage');
              favoiuritepage.favouritelist = CustomFavlist;
              return favoiuritepage;
            }))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: ColorConstants.bannerColor),
            useMaterial3: true),
      ),
    );
  }
}
