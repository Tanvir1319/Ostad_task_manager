import 'package:flutter/material.dart';
import 'package:task_manager1/style/style.dart';
import 'package:taskmanager/Style/Style.dart';

import '../../api/apiClient.dart';

class taskCreateScreen extends StatefulWidget {
  const taskCreateScreen({Key? key}) : super(key: key);

  @override
  State<taskCreateScreen> createState() => _taskCreateScreenState();
}

class _taskCreateScreenState extends State<taskCreateScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: colorGreen, title: Text('Create New Task')),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: Loading?(Center(child: CircularProgressIndicator())):(SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add New Task", style: Head1Text(colorDarkBlue)),
                  SizedBox(height: 1),
                  TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("title",Textvalue);
                    },
                    decoration: AppInputDecoration("Task Name"),
                  ),

                  SizedBox(height: 20),

                  TextFormField(
                    onChanged: (Textvalue){
                      InputOnChange("description",Textvalue);
                    },
                    maxLines: 10,
                    decoration: AppInputDecoration("Info"),
                  ),

                  SizedBox(height: 20),


                  Container(child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild('Create'),
                    onPressed: (){
                      FormOnSubmit();
                    },
                  ),),
                ],
              ),
            )),
          )
        ],
      ),

    );
  }
}