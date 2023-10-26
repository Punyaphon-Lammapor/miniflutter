import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
ImagePicker picker = ImagePicker();
File? path;

void chooseSourceImage() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Please Choose Source Image",
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    pickImage(ImageSource.camera);
                  },
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                  )),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void pickImage(ImageSource sources) async {
    final XFile? pickedFile = await picker.pickImage(source: sources);
    path = File(pickedFile!.path);
    // pref = await SharedPreferences.getInstance();
    // pref!.setString("path", pickedFile.path);
     setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child:  InkWell(
              onTap: () {
                chooseSourceImage();
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: path != null
                      ? DecorationImage(
                          image: FileImage(path!),
                          fit: BoxFit.cover,
                        )
                      : const DecorationImage(
                          image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/2815/2815428.png"),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              
            ),
            
            ),
             TextButton(
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                pref.clear();
                exit(0); //กรณีปิดแอป(Kill tasks)
              },
              child: const Text("ออกจากระบบ"),
            ),


          ],
        )
      ),
    );
  }
}