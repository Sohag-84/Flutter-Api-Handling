// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? image;
  final picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      Fluttertoast.showToast(msg: "No image selected");
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });

    var stream = http.ByteStream(image!.openRead());
    stream.cast();
    var length = await image!.length();

    var uri = Uri.parse("https://fakestoreapi.com/products");
    var request = http.MultipartRequest("POST", uri);

    request.fields['title'] = "Static title";
    var multipar = http.MultipartFile("image", stream, length);
    var response = await request.send();

    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: "Image uploaded");
      setState(() {
        showSpinner = false;
      });
    } else {
      Fluttertoast.showToast(msg: "Failed");
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(title: Text("Upload Image")),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => getImage(),
                child: Container(
                  child: image == null
                      ? Center(
                          child: Text("Pick image"),
                        )
                      : Center(
                        child: Image.file(
                          File(image!.path).absolute,
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                ),
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () => uploadImage(),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Upload",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
