import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:im_stepper/stepper.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'package:productbox_exe/constants/widgets.dart';
import 'package:productbox_exe/notifiers/steppermodel.dart';
import 'package:productbox_exe/stepper/stepperScreens/stepperform.dart';

import 'package:provider/provider.dart';

class DrivingLicense extends StatefulWidget {
  const DrivingLicense({Key? key}) : super(key: key);

  @override
  State<DrivingLicense> createState() => _DrivingLicenseState();
}

class _DrivingLicenseState extends State<DrivingLicense> {
  GlobalKey<FormState> licenseFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserModal>(builder: (context, modal, child) {
      return Form(
        key: licenseFormKey,
        child: ListView(
          padding: const EdgeInsets.all(
            12.0,
          ),
          children: [
            buildStartText(),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Theme(
                data: ThemeData(
                  primaryColor: greyshade5,
                ),
                child: Column(
                  children: [
                    DotStepper(
                      activeStep: modal.activeIndex,
                      dotRadius: 20.0,
                      shape: Shape.pipe,
                      spacing: 10.0,
                      dotCount: modal.dotCount,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(
                suffixIcon: IconButton(
                  onPressed: () async {
                    pickMyFile();
                  },
                  icon: Icon(Icons.image),
                ),
                filled: true,
                hintStyle: TextStyle(color: greyshade5),
                hintText: "License",
              ),
              //onChanged: (val) => modal.name= val,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  if (licenseFormKey.currentState?.validate() ?? false) {
                    // next
                    modal.changeStep(2);
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
            ),
          ],
        ),
      );
    });
  }

  void pickMyFile() async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'mp4']);
    if (result == null) return;
// openFiles(result.files);
    final file = result.files.first;
    openFile(file);
    print('name: ${file.name} ');
    print('ext: ${file.extension} ');
    print('path: ${file.path} ');
    final newFile = await saveFilePermanently(file);
    print('From Path: ${file.path!}');
    print('To Path: ${newFile.path}');
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file as String);
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFile.path);
  }
}
