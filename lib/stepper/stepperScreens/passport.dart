import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:im_stepper/stepper.dart';

import 'package:productbox_exe/notifiers/steppermodel.dart';
import 'package:productbox_exe/notifiers/image_provider.dart';

import 'package:productbox_exe/constants/widgets.dart';

import 'package:provider/provider.dart';

class Passport extends StatefulWidget {
  const Passport({Key? key}) : super(key: key);

  @override
  State<Passport> createState() => _PassportState();
}

class _PassportState extends State<Passport> {
  GlobalKey<FormState> passFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserModal>(builder: (context, modal, child) {
      return Form(
        key: passFormKey,
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
                filled: true,
                hintStyle: TextStyle(color: greyshade5),
                hintText: "passport",
              ),
              validator: RequiredValidator(
                errorText: "Required *",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  if (passFormKey.currentState?.validate() ?? false) {
                    // next
                    // print("ddd");
                    //  modal.changeStep(4);
                    Text('${modal.passport}');
                    Text('${modal.image}');
                    Text('${modal.license}');
                    Text('${modal.certificate}');
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: greyshade,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
                child: Text("done"),
              ),
            ),
          ],
        ),
      );
    });
  }
}
