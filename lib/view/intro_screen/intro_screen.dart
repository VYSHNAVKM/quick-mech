import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:quickmech/view/intro_screen/widgets/intro_screen1/intro_screen1.dart';
import 'package:quickmech/view/intro_screen/widgets/intro_screen2/intro_screen2.dart';
import 'package:quickmech/view/intro_screen/widgets/intro_screen3/intro_screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    // controller to keep track on which page we are on
    PageController _controller = PageController();
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroScreen1(),
              IntroScreen2(),
              IntroScreen3(),
            ],
          ),
          // dot indicators
          Container(
            alignment: Alignment(0, 0.80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        color: ColorConstants.bannerColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: ColorConstants.primaryWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                // dot indicator
                SmoothPageIndicator(
                  controller: _controller, // PageController
                  count: 3,
                  effect: SwapEffect(
                      dotColor: ColorConstants.systemGrey,
                      activeDotColor: ColorConstants.bannerColor,
                      dotHeight: 10,
                      dotWidth: 10), // your preferred effect
                ),
                // next or done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavBar(),
                              ));
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              color: ColorConstants.bannerColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'Done',
                              style: TextStyle(
                                  color: ColorConstants.primaryWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.bounceIn);
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                              color: ColorConstants.bannerColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Next',
                                style: TextStyle(
                                    color: ColorConstants.primaryWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: ColorConstants.primaryWhite,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
