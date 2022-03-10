import 'dart:io';

import 'package:flutter/material.dart';

import 'package:im_stepper/stepper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:productbox_exe/notifiers/image_provider.dart';

import 'package:productbox_exe/constants/widgets.dart';
import 'package:productbox_exe/notifiers/steppermodel.dart';

import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Consumer<MyImageProvider>(builder: (context, myImage, child) {
            return AlertDialog(
              title: Text(
                "Choose option",
                style: TextStyle(color: greyshade5),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Divider(
                      height: 1,
                      color: blueshade,
                    ),
                    ListTile(
                      onTap: () {
                        myImage.openGallery();
                      },
                      title: Text("Gallery"),
                      leading: Icon(
                        Icons.account_box,
                        color: greyshade5,
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: greyshade5,
                    ),
                    ListTile(
                      onTap: () {
                        myImage.openCamera();
                      },
                      title: Text("Camera"),
                      leading: Icon(
                        Icons.camera,
                        color: greyshade5,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModal>(builder: (context, modal, child) {
      return Form(
        key: profileFormKey,
        child: ListView(
          padding: const EdgeInsets.all(
            12.0,
          ),
          children: [
            buildStartText(),
            SizedBox(
              height: 30,
            ),
            buildStepper(modal),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              cursorHeight: 0,
              cursorWidth: 0,
              decoration: textInputDecoration.copyWith(
                suffixIcon: IconButton(
                  onPressed: () => _showChoiceDialog(context),
                  icon: Icon(Icons.image),
                ),
                filled: true,
                hintStyle: TextStyle(color: greyshade5),
                hintText: "Profile Picture",
              ),
              //  onChanged: (val) => modal.image= val as PickedFile?,
            ),
            SizedBox(
              height: 20,
            ),
            buildButton(modal),
            Consumer<MyImageProvider>(builder: (context, modall, child) {
              if (modall.imageFile == null) {
                return Text("Image can't be load");
              } else {
                return Image.file(modall.imageFile as File);
              }
            })
          ],
        ),
      );
    });
  }

  SizedBox buildButton(UserModal modal) {
    return SizedBox(
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          if (profileFormKey.currentState?.validate() ?? false) {
            modal.changeStep(1);
          }
        },
        style: ElevatedButton.styleFrom(
          primary: greyshade5,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
        child: Text("Next"),
      ),
    );
  }

  Center buildStepper(UserModal modal) {
    return Center(
      child: Theme(
        data: ThemeData(
          primaryColor: greyshade,
        ),
        child: Column(
          children: [
            DotStepper(
                activeStep: modal.activeIndex,
                dotRadius: 20.0,
                shape: Shape.pipe,
                spacing: 10.0,
                dotCount: modal.dotCount),
          ],
        ),
      ),
    );
  }
}
