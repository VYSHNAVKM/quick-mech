import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quickmech/controller/mechanic_controller/mechanic_controller.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/categorywise_worker_list/categorywise_workers_list.dart';
import 'package:quickmech/view/home_screen/item.dart';
import 'package:quickmech/view/home_screen/widgets/worker_profile.dart';
import 'package:quickmech/view/mechanic_profile_page/mechanic_profile_page.dart';
import 'package:quickmech/view/notification_screen.dart/notification_screen.dart';
import 'package:quickmech/view/search_screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // HomeData _homeData = HomeData();
  @override
  void initState() {
    Provider.of<MechanicController>(context, listen: false).getMechanic();
    super.initState();

    // _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
    //   if (CurrentPage < 3) {
    //     CurrentPage++;
    //   } else {
    //     CurrentPage = 0;
    //   }
    //   _pageController.animateToPage(CurrentPage,
    // //       duration: Duration(microseconds: 350), curve: Curves.easeIn);
    // });
    // @override
    // void dispose() {
    //   super.dispose();
    //   _timer?.cancel();
    // }
  }

  Categorylist _categorylist = Categorylist();
  // ScrollController _scrollController = ScrollController();

  int index = 0;
  // PageController _pageController = PageController(initialPage: 0);
  var pageindi;
  int CurrentPage = 0;
  // Timer? _timer;

  @override
  Widget build(BuildContext context) {
    // var favoiuritepage = context.watch<FavouriterController>();
    var Mediaheight = MediaQuery.sizeOf(context).height;
    var Mediawidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            pinned: true,
            actions: [
              InkWell(
                  onTap: () {
                    // if (index % 2 == 0) {
                    //   _isClicked = true;
                    // } else {
                    //   _isClicked = false;
                    // }
                    // index = index + 1;
                    // setState(() {});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationScreen()));
                  },
                  child: Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                  )),
              SizedBox(
                width: 40,
              ),
              Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
            ],
            title: Text(
              'QUICK MECH',
              style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            backgroundColor: ColorConstants.bannerColor,
            expandedHeight: Mediaheight * .2,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Align(
                    //     alignment: Alignment.topLeft,
                    //     child: AnimatedTextKit(
                    //       repeatForever: true,
                    //       animatedTexts: [
                    //         WavyAnimatedText(
                    //           'GoodMorning...',
                    //           textStyle: GoogleFonts.courgette(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 15),
                    //         ),
                    //       ],
                    //     )),
                    SizedBox(
                      height: Mediaheight * .1,
                    ),
                    // Search
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(),
                            ));
                      },
                      child: Container(
                        height: Mediaheight * .05,
                        width: Mediawidth * .7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Icon(
                                Icons.search,
                                size: 18,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Text('Search here...'),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList.list(addAutomaticKeepAlives: true, children: [
            SingleChildScrollView(
              primary: true,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.jpg'),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Divider(),
                      //CATEGORY LIST
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Category',
                              style: GoogleFonts.josefinSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                      ),
                      Container(
                          height: 120,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _categorylist.category.length,
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CategoryWiseWorkerscreen(
                                                      categoryName:
                                                          _categorylist
                                                              .category[index]
                                                              .category,
                                                    )));
                                      },
                                      child: Container(
                                          width: Mediawidth * .3,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: ColorConstants
                                                      .bannerColor),
                                              color:
                                                  ColorConstants.primaryWhite,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset:
                                                      Offset(9.0, 9), //(x,y)
                                                  blurRadius: 6.0,
                                                )
                                              ]),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Image.asset(
                                                  _categorylist
                                                      .category[index].image,
                                                  color: const Color.fromARGB(
                                                      255, 110, 106, 106),
                                                  fit: BoxFit.cover,
                                                  height: 50,
                                                ),
                                              ),
                                              Text(
                                                _categorylist
                                                    .category[index].category,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          )),
                                    ),
                                  ))),
                      Divider(),
                      //workers list
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Our partners',
                              style: GoogleFonts.josefinSans(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                      ),
                      Container(
                        height: Mediaheight * .4,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            scrollDirection: Axis.horizontal,
                            itemCount: Provider.of<MechanicController>(context,
                                    listen: false)
                                .mechanicList
                                .length,
                            itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MechanicProfile(index: index),
                                      ));
                                },
                                child: CustomWorkerProfileContainer(
                                    index: index))),
                      ),
                      // SizedBox(
                      //   height: Mediaheight * .1,
                      // ),
                    ],
                  ),
                ),
              ),
            )
          ])
        ],
      ),
    );
  }
}
