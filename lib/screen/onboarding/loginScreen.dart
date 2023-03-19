import 'package:flutter/material.dart';

import 'package:task_manager1/style/style.dart';

import '../../api/apiClient.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  Map<String, String> FormValues = {'email': '', 'password': ''};
  bool Loading = false;

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['email']!.length == 0) {
      ErrorToast("Email is needed");
    } else if (FormValues['password']!.length == 0) {
      ErrorToast('Password is not given');
    } else {
      setState(() {
        Loading = true;
      });

      bool res = await LoginRequest(FormValues);
      if (res == true) {
        setState(() {
          Navigator.pushNamedAndRemoveUntil(
              context, '/newTaskScreen', (route) => false);
        });
      } else {
        setState(() {
          Loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ScreenBackground(context),
        Container(
            alignment: Alignment.center,
            child: Loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : (SingleChildScrollView(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Get Started With',
                          style: Head1Text(colorDarkBlue),
                        ),
                        SizedBox(
                          height: 1.0,
                        ),
                        Text(
                          'Learn with rabbil hassan',
                          style: Head6Text(colorLightGray),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: AppInputDecoration('Email Adrees'),
                          onChanged: (Textvalue) {
                            InputOnChange('email', Textvalue);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: AppInputDecoration('Password'),
                          onChanged: (Textvalue) {
                            InputOnChange('password', Textvalue);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          child: ElevatedButton(
                            style: AppButtonStyle(),
                            child: SuccessButtonChild('Login'),
                            onPressed: () {
                              FormOnSubmit();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/emailverification');
                                },
                                child: Text(
                                  'Forget Password',
                                  style: Head7Text(colorLightGray),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/registration');
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account?",
                                      style: Head7Text(colorDarkBlue),
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    Text(
                                      "Sign Up",
                                      style: Head7Text(colorGreen),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))),
      ],
    ));
  }
}
