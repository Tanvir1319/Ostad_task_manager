import 'package:flutter/material.dart';
import 'package:task_manager1/api/apiClient.dart';
import 'package:task_manager1/components/TaskList.dart';

class Completetask extends StatefulWidget {
  const Completetask({super.key});

  @override
  State<Completetask> createState() => _CompletetaskState();
}

class _CompletetaskState extends State<Completetask> {
  List TaskItems = [];
  bool Loading = true;

  @override
  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    var data = await TaskListRequest('Completed');
    setState(() {
      Loading = false;
      TaskItems = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Loading
        ? (Center(
            child: CircularProgressIndicator(),
          ))
        : RefreshIndicator(
            child: TaskList(TaskItems),
            onRefresh: () async {
              await CallData();
            },
            
            );
  }
}
