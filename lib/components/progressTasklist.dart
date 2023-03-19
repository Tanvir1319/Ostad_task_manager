import 'package:flutter/material.dart';
import 'package:task_manager1/api/apiClient.dart';
import 'package:task_manager1/components/TaskList.dart';

class ProgresstaskList extends StatefulWidget {
  const ProgresstaskList({super.key});

  @override
  State<ProgresstaskList> createState() => _ProgresstaskListState();
}

class _ProgresstaskListState extends State<ProgresstaskList> {



 List TaskItems = [];
  bool Loading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    var data = await TaskListRequest('Progress');
    setState(() {
      Loading = false;
      TaskItems = data;
    });
  }



  @override
  Widget build(BuildContext context) {
     return Loading?(Center(child: CircularProgressIndicator(),)):
     
    RefreshIndicator(
            child: TaskList(TaskItems),
            onRefresh: () async {
              await CallData();
            },
            
            );
  }
}