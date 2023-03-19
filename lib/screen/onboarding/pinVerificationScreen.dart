import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager1/api/apiClient.dart';
import 'package:task_manager1/utility/utility.dart';

import '../../style/style.dart';

class pinverificationScreen extends StatefulWidget {
  const pinverificationScreen({super.key});

  @override
  State<pinverificationScreen> createState() => _pinverificationScreenState();
}

class _pinverificationScreenState extends State<pinverificationScreen> {
  Map<String, String> FormValues = {
    "otp": "",
  };
  bool Loading = false;

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['otp']!.isEmpty == 0) {
      ErrorToast('OTP Required !');
    } else {
      setState(() {
        Loading = true;
      });
      String? emailAddres = await ReadUserData('EmailVerification');
      bool res = await VerifyOTPRequest(emailAddres, FormValues['OTP']);
      if (res == true) {
        setState(() {
          Navigator.pushNamedAndRemoveUntil(
              context, '/setpassword', (route) => false);
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
                ? (Center(child: CircularProgressIndicator(),))
                : (SingleChildScrollView(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'PIN Verification',
                          style: Head1Text(colorDarkBlue),
                        ),
                        SizedBox(
                          height: 1.0,
                        ),
                        Text(
                          'Verify your pin here',
                          style: Head6Text(colorLightGray),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        PinCodeTextField(
                            appContext: context,
                            length: 6,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 40,
                              activeFillColor: Colors.white,
                            ),
                            animationDuration: Duration(milliseconds: 300),
                            onCompleted: (v) {},
                            onChanged: (value) {}),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          child: ElevatedButton(
                            style: AppButtonStyle(),
                            child: SuccessButtonChild('Verify'),
                            onPressed: () {
                              FormOnSubmit();
                            },
                          ),
                        )
                      ],
                    ),
                  ))),
      ],
    ));
  }
}
