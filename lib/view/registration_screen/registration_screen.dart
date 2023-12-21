import 'package:flutter/material.dart';
import 'package:quickmech/utils/color_constants.dart';
import 'package:quickmech/view/login_screen/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _isSecurePassword = true;
  // RegistrationController registrationController = RegistrationController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  FocusNode fieldone = FocusNode();
  FocusNode fieldtwo = FocusNode();
  FocusNode fieldthree = FocusNode();
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    // var mediaheight = MediaQuery.sizeOf(context).height;
    var mediawidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: ColorConstants.bannerColor),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailcontroller,
                    focusNode: fieldone,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(fieldtwo);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('require');
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: usernamecontroller,
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    focusNode: fieldtwo,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(fieldthree);
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'username',
                        prefixIcon: Icon(Icons.person)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('require');
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    focusNode: fieldthree,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'password',
                        prefixIcon: Icon(Icons.key),
                        suffixIcon: togglePassword()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('require');
                      } else {
                        return null;
                      }
                    },
                    obscureText: _isSecurePassword,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 1),
                      child: Text(
                        'Already have account',
                        style: TextStyle(fontSize: mediawidth * .03),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 5),
              child: InkWell(
                onTap: () {
                  // if (formkey.currentState!.validate()) {
                  //   registrationController.SaveUserData(UserRegModel(
                  //       email: emailcontroller.text,
                  //       username: usernamecontroller.text,
                  //       password: passwordcontroller.text));
                  // }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.bannerColor,
                      borderRadius: BorderRadius.circular(15)),
                  height: 50,
                  child: Center(
                    child: Text(
                      "Signup",
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
    );
  }

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
