import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/utils/textstyle_constants.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Terms And Conditions'),
        backgroundColor: ColorConstants.bannerColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ColorConstants.bannerColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  'SERVICES',
                  style: TextStyleConstants.heading3,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'The Services constitute a technology platform that enables Users of the Companys Platform, provided as part of the Services, to arrange and schedule repair or maintenance services for your car with independent third-party providers. Once you submit a request, we may provide you with a list of possible service providers along with their experience information. The Company also provides towing service to get your vehicle out of the situation and back on road on a chargeable basis.You acknowledge that the Company does not provide any repair and maintenance services for its customers and that all such above stated services are provided by other independent third-party contractors who are not employed by the Company.You acknowledge that even after accepting and/or confirming an appointment for service/repair of your car, the Company cannot guarantee its availability. At the time of your appointment request to the Company, the Company will make reasonable efforts to connect you with the independent third-party service provider so that you can avail automobile repair service at or near your location.You acknowledge that the cost and time period for the services/repairs are estimated in accordance with your request and are proximate in nature.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                  color: ColorConstants.bannerColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  'ELIGIBILITY',
                  style: TextStyleConstants.heading3,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'You hereby represent and warrant that you are eighteen (18) years of age or above and are fully able and competent to understand and agree to the terms, conditions, obligations, affirmations, representations, and warranties set forth in these terms, and to abide by and comply with the Terms stated therein.You are in compliance with all laws and regulations in the country in which you live when you access and use the Services. You agree to use the Services only in compliance with these Terms and applicable laws, and in a manner that does not violate our legal rights or those of any third-parties.If you will be using the Services on behalf of an organization, you agree to these Terms on behalf of that organization and you represent that you have the authority to act on behalf of your organization.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                  color: ColorConstants.bannerColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  'TERMINATION',
                  style: TextStyleConstants.heading3,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'The Company may terminate your usage of the Platform or any Service at any time for any reason, including breach of the Terms and Conditions. The Company has the right (but not the obligation) to refuse to grant access to the Platform. Except for the rights and licenses granted in these Terms, we reserve all other rights and grant no other rights or licenses, implied or otherwise. Once temporarily suspended, indefinitely suspended or terminated, you may not continue to use the Platform under the same account, a different account or re-register under a new account. On termination of an account due to the reasons mentioned herein, such User shall no longer have access to data, messages and other material kept on the Platform by such User. You may terminate these terms at any time, for any reason. The obligations and liabilities incurrent by the parties prior to the termination date, for all intents and purposes, will survive the termination of these Terms. These Terms will remain in effect until either you or we terminate them. If you fail, or we suspect you have failed, to comply with any term or provision of these Terms, we may terminate this agreement without notice, and you will remain liable for all amounts due up to and including the date of termination.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                  color: ColorConstants.bannerColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  'LICENSE',
                  style: TextStyleConstants.heading3,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Subject to your compliance with these Terms, the Company grants you a limited, non-exclusive, non-sublicensable, revocable, non-transferable licence to (i) access and use the Applications on your personal device solely in connection with your use of the Services; and (ii) access and use any content, information, and related materials that may be made available through the Services, in each case, solely in connection with your use of the Services. The Company and its licensors reserve all rights not expressly granted herein. You will not use, copy, adapt, modify, prepare derivative works based upon, distribute, license, sell, transfer, publicly display, publicly perform, transmit, stream, broadcast or otherwise exploit the Platform and Services, except as expressly permitted in the Terms and Conditions. No licenses or rights are granted to you by implication or otherwise under any intellectual property rights owned or controlled by the Company or its licensors, except for the licenses and rights expressly granted in the Terms and Conditions. The Platform and the intellectual property rights vested therein are owned by the Company.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
