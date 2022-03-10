import 'package:flutter/material.dart';

import 'package:productbox_exe/constants/widgets.dart';
import 'package:productbox_exe/notifiers/steppermodel.dart';

import 'package:productbox_exe/stepper/stepperScreens/certificte.dart';
import 'package:productbox_exe/stepper/stepperScreens/licensee.dart';
import 'package:productbox_exe/stepper/stepperScreens/passport.dart';

import 'package:productbox_exe/stepper/stepperScreens/profile.dart';

import 'package:provider/provider.dart';

class StepperDocs extends StatefulWidget {
  const StepperDocs({Key? key}) : super(key: key);

  @override
  _StepperDocsState createState() => _StepperDocsState();
}

class _StepperDocsState extends State<StepperDocs> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserModal>(
      create: (context) => UserModal(),
      child: Scaffold(
        backgroundColor: blueshade,
        body: Consumer<UserModal>(
          builder: (context, modal, child) {
            switch (modal.activeIndex) {
              case 0:
                return const Profile();
              case 1:
                return const DrivingLicense();
              case 2:
                return const Certificate();
              case 3:
                return const Passport();
              default:
                return const Profile();
            }
          },
        ),
      ),
    );
  }
}
