import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/activity_screen/activity.dart';
import 'package:quickmech/view/home_screen/home_screen.dart';
import 'package:quickmech/view/profile_screen/profile_screen.dart';
// import 'package:quickmech/view/homescreen/homescreen.dart';
import 'package:quickmech/view/saved/saved_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [HomeScreen(), saved(), ActivityScreen(), ProfileScreen()];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: ColorConstants.bannerColor,
          inactiveColorPrimary: ColorConstants.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.bookmark),
          title: ("Saved"),
          activeColorPrimary: ColorConstants.bannerColor,
          inactiveColorPrimary: ColorConstants.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.history),
          title: ("History"),
          activeColorPrimary: ColorConstants.bannerColor,
          inactiveColorPrimary: ColorConstants.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          title: ("Profile"),
          activeColorPrimary: ColorConstants.bannerColor,
          inactiveColorPrimary: ColorConstants.systemGrey,
        ),
      ];
    }

    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}
