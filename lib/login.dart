import 'package:flutter/material.dart';

import 'package:productbox_exe/constants/widgets.dart';

import 'package:productbox_exe/responsive/layoutbuilder_helper.dart';

import 'package:productbox_exe/services/api.dart';

String? email;
String? password;

final _formKey = GlobalKey<FormState>();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: blueshade,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              widthFactor: 0.6,
              heightFactor: 0.6,
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(200)),
                color: Color.fromRGBO(255, 255, 255, 0.4),
                child: Container(
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            Responsive(
              mobile: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text("Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40)),
                      SizedBox(
                        height: 20,
                      ),
                      const BuildEmailField(),
                      SizedBox(
                        height: 20,
                      ),
                      const BuildPasswordField(),
                      SizedBox(
                        height: 20,
                      ),
                      BuildSubmitButtonField(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Register Here',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              tab: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(children: [
                                Container(
                                    height: 400,
                                    width: 427,
                                    color: greyshade,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          Text("Login",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40)),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          const BuildEmailField(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          const BuildPasswordField(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          BuildSubmitButtonField(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Forgot Password?',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Register Here',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ))
                              ]),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildSubmitButtonField extends StatelessWidget {
  BuildSubmitButtonField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            Api api = Api();
            bool temp = await api.login(email!);
            if (temp) {
              Navigator.pushNamed(context, '/StepperDocs');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("User Does not exist"),
                ),
              );
            }
          }
        },
        style: ElevatedButton.styleFrom(
          primary: greyshade5,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
        child: Text('Login'),
      ),
    );
  }
}

class BuildPasswordField extends StatelessWidget {
  const BuildPasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: passValidator,
      onSaved: (value) {
        if (value != null) {
          password = value;
        }
      },
      decoration: textInputDecoration.copyWith(
        filled: true,
        hintStyle: TextStyle(color: greyshade5),
        hintText: "Pasword",
      ),
    );
  }
}

class BuildEmailField extends StatelessWidget {
  const BuildEmailField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: emailValidator,
      onSaved: (value) {
        if (value != null) {
          email = value;
        }
      },
      decoration: textInputDecoration.copyWith(
        filled: true,
        hintStyle: TextStyle(color: greyshade5),
        hintText: "Email",
      ),
    );
  }
}
