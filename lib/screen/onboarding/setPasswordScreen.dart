import 'package:flutter/material.dart';
import 'package:task_manager1/api/apiClient.dart';
import 'package:task_manager1/utility/utility.dart';

import '../../style/style.dart';

class setpasswordScreen extends StatefulWidget {
  const setpasswordScreen({super.key});

  @override
  State<setpasswordScreen> createState() => _setpasswordScreenState();
}

class _setpasswordScreenState extends State<setpasswordScreen> {
  Map<String, String> FormValues = {"email": "", "OTP": "", "password": "","cpassword":""};
  bool Loading = false;

  @override
  initState() {
    super.initState();
  }

  CallStoreData() async {
    String? Email = await ReadUserData('EmailVerification');
    String? OTP = await ReadUserData('OTPVerification');
    InputOnChange('email', Email);
    InputOnChange('OTP', OTP);
  }

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['password']!.isEmpty == 0) {
      ErrorToast('Password Required !');
    } else if (FormValues['password'] != FormValues['cpassword']) {
      ErrorToast('Password is not matched with confirm passsword');
    } else {
      setState(() {
        Loading = true;
      });

      bool res = await SetPasswordRequest(FormValues);
      if (res == true) {
        setState(() {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false);
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
          child: Loading?(Center(child: CircularProgressIndicator(),)):(
            SingleChildScrollView(
              padding: EdgeInsets.all(30.0),
              child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Set Password',
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
                decoration: AppInputDecoration('Password'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: AppInputDecoration('Confirm Password'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: ElevatedButton(
                  style: AppButtonStyle(),
                  child: SuccessButtonChild('Confirm'),
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
    ));
  }
}
