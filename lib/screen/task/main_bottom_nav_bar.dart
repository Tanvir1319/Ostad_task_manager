import 'package:flutter/material.dart';
import 'package:task_manager1/screen/task/addTask.dart';
import 'package:task_manager1/screen/task/cancelTasklistScreen.dart';
import 'package:task_manager1/screen/task/completedTasklist.dart';
import 'package:task_manager1/screen/task/newTasklist.dart';
import 'package:task_manager1/screen/task/progressTasklist.dart';

import '../../widgets/reuseable_app_bar.dart';

class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  int currentSelectedScreen = 0;

  List<Widget> screens = [
    NewTaskScreen(),
    Completetask(),
    Canceltask(),
    Progresstask(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildReuseableAppBar(context),
      floatingActionButton: currentSelectedScreen == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)=> AddTaskScreen())
                );
              },
              backgroundColor: Colors.green,
              child: Icon(Icons.add),
            )
          : SizedBox(),
      body: screens[currentSelectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.green,
        selectedItemColor: Colors.amber,
        elevation: 8.0,
        currentIndex: currentSelectedScreen,
        onTap: (index) {
          currentSelectedScreen = index;
          setState(() {
            currentSelectedScreen = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cancel_schedule_send),
            label: 'Cancelled',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh),
            label: 'Progress',
          )
        ],
      ),
    );
  }
}
