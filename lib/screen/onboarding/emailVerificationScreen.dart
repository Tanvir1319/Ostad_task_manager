import 'package:flutter/material.dart';
import 'package:task_manager1/api/apiClient.dart';

import '../../style/style.dart';

class emailverificationScreen extends StatefulWidget {
  const emailverificationScreen({super.key});

  @override
  State<emailverificationScreen> createState() =>
      _emailverificationScreenState();
}

class _emailverificationScreenState extends State<emailverificationScreen> {
  Map<String, String> FormValues = {
    "email": "",
  };
  bool Loading = false;

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['email']!.isEmpty == 0) {
      ErrorToast('Email Required !');
    } else {
      setState(() {
        Loading = true;
      });

      bool res = await VerifyEmailRequest(FormValues['email']);
      if (res == true) {
        setState(() {
          Navigator.pushNamedAndRemoveUntil(
              context, '/pinverification', (route) => false);
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
          child: Loading?(Center(
            child: CircularProgressIndicator(),
          )):(
            SingleChildScrollView(
              padding: EdgeInsets.all(30.0),
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your Email Adress',
                style: Head1Text(colorDarkBlue),
              ),
              SizedBox(
                height: 1.0,
              ),
              Text(
                'Instructions',
                style: Head6Text(colorLightGray),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: AppInputDecoration('Email Adrees'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: ElevatedButton(
                  style: AppButtonStyle(),
                  child: SuccessButtonChild('Next'),
                  onPressed: () {
                    FormOnSubmit();
                  },
                ),
              )
            ],
          ),
            )
          ),
         
        ),
      ],
    ),
    );
  }
}
