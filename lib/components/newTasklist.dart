import 'package:flutter/material.dart';
import 'package:task_manager1/api/apiClient.dart';
import 'package:task_manager1/components/TaskList.dart';

class newTaskList extends StatefulWidget {
  const newTaskList({super.key});

  @override
  State<newTaskList> createState() => _newTaskListState();
}

class _newTaskListState extends State<newTaskList> {
  List TaskItems = [];
  bool Loading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    var data = await TaskListRequest('New');
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
