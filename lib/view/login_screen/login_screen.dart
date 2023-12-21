import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/intro_screen/intro_screen.dart';
import 'package:quickmech/view/registration_screen/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int index = 0;
  bool _isSecurePassword = true;

  // RegistrationController registrationController = RegistrationController();
  final _formkey = GlobalKey<FormState>();
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediawidth = MediaQuery.sizeOf(context).width;
    var mediaheight = MediaQuery.sizeOf(context).height;
    FocusNode fieldone = FocusNode();
    FocusNode fieldtwo = FocusNode();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 42),
                ),
                height: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(80),
                    ),
                    color: ColorConstants.bannerColor),
                // child: Image.asset(
                //   'assets/images/shopping.png',
                //   fit: BoxFit.cover,
                // ),
              ),
              Container(
                color: ColorConstants.bannerColor,
                child: Container(
                  height: 526,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70),
                          bottomRight: Radius.circular(60)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.bannerColor),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            TextFormField(
                              controller: _usernamecontroller,
                              keyboardType: TextInputType.emailAddress,
                              scrollPhysics: NeverScrollableScrollPhysics(),
                              focusNode: fieldone,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(fieldtwo);
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'username or email',
                                  prefixIcon: Icon(Icons.person)),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return ('required');
                                  // } else if (value.isNotEmpty &&
                                  //     mydb.keys.contains(value)) {
                                  //   return ("UserName is not registered");
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _passwordcontroller,
                              scrollPhysics: NeverScrollableScrollPhysics(),
                              focusNode: fieldtwo,
                              // onFieldSubmitted: (value) {
                              //   FocusScope.of(context).requestFocus(fieldtwo);
                              // },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'password',
                                  prefixIcon: Icon(Icons.key),
                                  suffixIcon: togglePassword()),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return ('required');
                                } else {
                                  return (null);
                                }
                              },
                              obscureText: _isSecurePassword,
                            ),
                          ],
                        ),
                      ),
                      // Positioned(
                      //     bottom: 450,
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(left: 180),
                      //       child: Container(child: Text('OR')),
                      //     )),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationScreen()));
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 1),
                                child: Text(
                                  'Dont have account?',
                                  style: TextStyle(fontSize: mediawidth * .03),
                                ),
                              )),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 5),
                        child: InkWell(
                          onTap: () {
                            if (_formkey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IntroScreen()));
                              // checkLogin(context, 0);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorConstants.bannerColor,
                                borderRadius: BorderRadius.circular(15)),
                            height: 50,
                            child: Center(
                              child: Text(
                                "Sign in",
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
              ),
              Column(
                children: [
                  Align(
                    child: Container(
                      height: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(80),
                          ),
                          color: ColorConstants.bannerColor),
                      // child: Image.asset(
                      //   'assets/images/shopping.png',
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  // void checkLogin(BuildContext context, index) async {
  //   final _username = _usernamecontroller.text;
  //   final _password = _passwordcontroller.text;
  //   if (_username == registrationController.userCred[index].email ||
  //       _username == registrationController.userCred[index].username &&
  //           _password == registrationController.userCred[index].password) {
  //     final _sharedPref = await SharedPreferences.getInstance();
  //     await _sharedPref.setBool(SAVE_KEY_NAME, true);
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => WelcomePage()));
  //   } else {
  //     final _errorMessage = 'password and username does not matchhhhh';
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.red,
  //         margin: EdgeInsets.all(10),
  //         content: Text(_errorMessage)));
  //   }
  // }

  Widget togglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isSecurePassword = !_isSecurePassword;
          });
        },
        icon: _isSecurePassword
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off));
  }
}
