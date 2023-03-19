import 'package:flutter/material.dart';
import 'package:task_manager1/screen/onboarding/emailVerificationScreen.dart';
import 'package:task_manager1/screen/onboarding/loginScreen.dart';
import 'package:task_manager1/screen/onboarding/pinVerificationScreen.dart';
import 'package:task_manager1/screen/onboarding/registrationScreen.dart';
import 'package:task_manager1/screen/onboarding/setPasswordScreen.dart';
import 'package:task_manager1/screen/onboarding/splashScreen.dart';
import 'package:task_manager1/screen/task/homeScreen.dart';
import 'package:task_manager1/utility/utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await ReadUserData('token');
  if (token ==null) {
    runApp(MyApp('/login'));
  } else {
    runApp(MyApp('/homescreen'));
  }
}

class MyApp extends StatelessWidget {
  final String FirstRoute;
  const MyApp(this.FirstRoute);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      initialRoute: '/homescreen',
      routes: {
        '/': (context) => splashScreen(),
        '/login': (context) => loginScreen(),
        '/registration': (context) => registrationScreen(),
        '/emailverification': (context) => emailverificationScreen(),
        '/pinverification': (context) => pinverificationScreen(),
        '/setpassword': (context) => setpasswordScreen(),
        '/homescreen': (context) => homeScreen(),
     
      },
    );
  }
}
