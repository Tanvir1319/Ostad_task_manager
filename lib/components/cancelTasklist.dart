import 'package:flutter/material.dart';
import 'package:task_manager1/api/apiClient.dart';
import 'package:task_manager1/components/TaskList.dart';

class cancelTask extends StatefulWidget {
  const cancelTask({super.key});

  @override
  State<cancelTask> createState() => _cancelTaskState();
}

class _cancelTaskState extends State<cancelTask> {




 List TaskItems = [];
  bool Loading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    var data = await TaskListRequest('Cancel');
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