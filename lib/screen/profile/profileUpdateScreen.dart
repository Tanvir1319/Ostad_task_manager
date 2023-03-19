import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager1/widgets/reuseable_app_bar.dart';

import '../../style/style.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  XFile? photoFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildReuseableAppBar(context, isTappable: false),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ScreenBackground(context),
            Container(
              padding: EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Update Your Profile',
                    style: Head1Text(colorDarkBlue),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  InkWell(
                    onTap: () async {
                      final imagePicker = ImagePicker();
                      final result = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      if (result != null) {
                        photoFile = result;
                        setState(() {
                          
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: Text(
                              'Photo',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          
                          Expanded(child: Text(photoFile?.name?? '',maxLines: 1,),),
                        ],
                      ),
                    ),
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
                    decoration: AppInputDecoration('Confirm Password'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      child: SuccessButtonChild('Update'),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
