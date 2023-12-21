import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickmech/utils/color_constants.dart';

class edit_profile extends StatefulWidget {
  const edit_profile({super.key});

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  final _formkey = GlobalKey<FormState>();

  Uint8List? _image;
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Stack(
                  children: [
                    _image != null
                        ? Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: MemoryImage(_image!),
                                    fit: BoxFit.cover),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                          )
                        : Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://th.bing.com/th/id/OIP.ok20ZEluhnlQQzWG26XEnwHaHa?pid=ImgDet&rs=1"),
                                    fit: BoxFit.cover),
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20))),
                    Positioned(
                        bottom: -4,
                        right: -4,
                        child: CircleAvatar(
                          radius: 19,
                          backgroundColor: ColorConstants.primaryWhite,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: ColorConstants.systemGrey,
                            child: InkWell(
                              onTap: () {
                                showImagePickerOption(context);
                              },
                              child: Icon(
                                Icons.photo_camera,
                                size: 20,
                                color: ColorConstants.primaryBlack,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ("Name required");
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return (" Email required");
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Mobile",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ("Required");
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 5),
              child: InkWell(
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    // checkLogin(context, 0);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  height: 50,
                  child: Center(
                    child: Text(
                      "Save",
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

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        shape: Border.symmetric(),
        context: context,
        builder: (builder) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 9,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 30,
                            ),
                            Text("Camera")
                          ],
                        ),
                      )),
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              size: 30,
                            ),
                            Text("Gallery")
                          ],
                        ),
                      )),
                ),
              ],
            ),
          );
        });
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
