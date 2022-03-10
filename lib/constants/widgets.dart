import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

//field decor
const textInputDecoration = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    contentPadding: EdgeInsets.all(12.0),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
      Radius.circular(50),
    )));

//constant text

Text buildStartText() => Text("Upload Documents",
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 35, color: Colors.white));

//colors values

Color? greyshade = Colors.grey[200];
Color? blueshade = Colors.blueGrey.shade800;
Color? greyshade5 = Colors.grey[500];

//validat

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'email is required'),
  PatternValidator(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
      errorText: 'email must have @ and .com special character')
]);

final passValidator =
    RequiredValidator(errorText: 'password field is required');
