import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/utils/textstyle_constants.dart';
import 'package:quickmech/view/booking_page/order_details.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool sheduledbooking = false;

  TimeOfDay Fromtime = TimeOfDay(hour: 10, minute: 30);
  TimeOfDay Totime = TimeOfDay(hour: 10, minute: 30);

  @override
  Widget build(BuildContext context) {
    // final hours = Fromtime.hour.toString().padLeft(2, '0');
    // final minutes = Fromtime.minute.toString().padLeft(2, '0');
    // final Fromhours = Totime.hour.toString().padLeft(2, '0');
    // final Tominutes = Totime.minute.toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Mechanic"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 25),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sheduledbooking = false;
                      });
                    },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(13)),
                        height: 50,
                        width: 150,
                        child: Center(
                          child: Text(
                            "Instant Booking",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sheduledbooking = true;
                      });
                    },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(13)),
                        height: 50,
                        width: 150,
                        child: Center(
                          child: Text(
                            "Scheduled Booking",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            sheduledbooking == true
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        child: Text(
                          "Time Peroid",
                          style: TextStyleConstants.heading3,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "From",
                              style: TextStyleConstants.heading5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: SizedBox(
                                width: 200,
                                height: 50,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          "${Fromtime.hour}-${Fromtime.minute}",
                                          style: TextStyleConstants.heading5),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                          onTap: () async {
                                            TimeOfDay? newTime =
                                                await showTimePicker(
                                                    context: context,
                                                    initialTime: Fromtime);
                                            //if cancel
                                            if (newTime == null) return;
                                            //if ok
                                            setState(() => Fromtime = newTime);
                                          },
                                          child: Icon(
                                            Icons.schedule,
                                            color: Colors.blue,
                                          ))
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Text(
                              "To",
                              style: TextStyleConstants.heading5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: SizedBox(
                                width: 200,
                                height: 50,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "${Totime.hour}-${Totime.minute}",
                                        style: TextStyleConstants.heading5,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                          onTap: () async {
                                            TimeOfDay? newTime =
                                                await showTimePicker(
                                                    context: context,
                                                    initialTime: Totime);
                                            //if cancel
                                            if (newTime == null) return;
                                            //if ok
                                            setState(() => Totime = newTime);
                                          },
                                          child: Icon(
                                            Icons.schedule,
                                            color: Colors.blue,
                                          ))
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Text(
                "Location",
                style: TextStyleConstants.heading3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SizedBox(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Current location",
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(),
                            onPressed: () {},
                            child: Text("Change")),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SizedBox(
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: "Add message",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              child: Card(
                elevation: 10,
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("cancel"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => orderdetails(),
                                ),
                              );
                            },
                            child: Text("Order details"),
                          )
                        ],
                        title: Text("your booking is placed"),
                        contentPadding: EdgeInsets.all(20),
                        content: Text("mechanic will arrive in 15 minutes"),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: ColorConstants.bannerColor,
                        borderRadius: BorderRadius.circular(13)),
                    child: Center(
                        child: Text("Book",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16))),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
