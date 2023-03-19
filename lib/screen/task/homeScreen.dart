import 'package:flutter/material.dart';
import 'package:task_manager1/components/appBottomNav.dart';
import 'package:task_manager1/components/cancelTasklist.dart';
import 'package:task_manager1/components/completedTasklist.dart';
import 'package:task_manager1/components/newTasklist.dart';
import 'package:task_manager1/components/progressTasklist.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int TabIndex = 0;

  onItemTapped(int index) {
    setState(() {
      TabIndex = index;
    });
  }

  final widgetOptions = [
    newTaskList(),
    ProgresstaskList(),
    Completetask(),
    cancelTask(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widgetOptions.elementAt(TabIndex),
      bottomNavigationBar: appBottomNav(TabIndex, onItemTapped),
    );
  }
}
