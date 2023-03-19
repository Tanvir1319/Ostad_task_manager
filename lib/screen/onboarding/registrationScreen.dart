import 'package:flutter/material.dart';
import 'package:task_manager1/api/apiClient.dart';
import 'package:task_manager1/style/style.dart';



class registrationScreen extends StatefulWidget {
  const registrationScreen({super.key});

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {
  Map<String, String> FormValues = {
    "email": "",
    "firstName": "",
    "lastName": "",
    "mobile": "",
    "password": "",
    "photo": "",
    "cpassword": "",
  };
  bool Loading = false;

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }






  FormOnSubmit() async {
    if(FormValues['email']!.isEmpty==0){
      ErrorToast('Email Required !');
    }
    
    else if (FormValues['firstName']!.isEmpty==0) {
      ErrorToast('firstName is not given');
    } else if (FormValues['lastName']!.isEmpty==0) {
      ErrorToast('lastName is not given');
    } else if (FormValues['mobile']!.isEmpty==0) {
      ErrorToast('mobile is not given');
    } else if (FormValues['password']!.isEmpty==0) {
      ErrorToast('Password is not given');
    } else if (FormValues['password'] != FormValues['cpassword']) {
      ErrorToast('Password is not matched with confirm passsword');
    } else {
      setState(() {
        Loading = true;
      });

      bool res = await RegitrationRequest(FormValues);
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
          child: SingleChildScrollView(
            child: Loading?(
              Center(child: CircularProgressIndicator(),)
            ):(
              Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Join with us',
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
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: AppInputDecoration('First Name'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: AppInputDecoration('Last Name'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: AppInputDecoration('Mobile Number'),
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
                decoration: AppInputDecoration('COnfirm Password'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: ElevatedButton(
                  style: AppButtonStyle(),
                  child: SuccessButtonChild('Registration'),
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
        ),
      ],
    ));
  }
}
