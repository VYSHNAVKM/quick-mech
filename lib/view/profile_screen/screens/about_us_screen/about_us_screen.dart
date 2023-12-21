import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.bannerColor,
        centerTitle: true,
        title: Text('About us'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                '"Quickmech aims to be the best of both worlds. Reliable and Cost-effective Car Services"',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              color: ColorConstants.bannerColor,
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Vehicle Servicing and Vehicle repairs - we are your one-stop solution for all things cars. A brainchild of 6 friends - Abhishek B Ambady, Ashfak Ashraf, Cideep Krishnan, Choison Shaju, Emmanuval Davis, Vyshnav K M, GoMechanic is a network of technology, offering a seamless car service experience at the convenience of a tap. With our highly skilled technicians, manufacturer recommended procedures and the promise of genuine spare parts we are your best bet. Stay in the comforts of your home or office and make the most of our complimentary pick-up and drop-in service. Count on us to be your personal car care expert, advisor and car mechanic.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Our Team',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: ColorConstants.bannerColor,
                            radius: 70,
                          ),
                          Text(
                            'Abhishek B Ambady',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CircleAvatar(
                            backgroundColor: ColorConstants.bannerColor,
                            radius: 70,
                          ),
                          Text(
                            'Ashfak Ashraf',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CircleAvatar(
                            backgroundColor: ColorConstants.bannerColor,
                            radius: 70,
                          ),
                          Text(
                            'Cideep Krishnan',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: ColorConstants.bannerColor,
                            radius: 70,
                          ),
                          Text(
                            'Choison Shaju',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CircleAvatar(
                            backgroundColor: ColorConstants.bannerColor,
                            radius: 70,
                          ),
                          Text(
                            'Emmanuval Davis',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CircleAvatar(
                            backgroundColor: ColorConstants.bannerColor,
                            radius: 70,
                          ),
                          Text(
                            'Vyshnav K M',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
