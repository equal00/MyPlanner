import 'package:flutter/material.dart';

void main() {
  runApp(const TimePlannerScreen());
}

class TimePlannerScreen extends StatelessWidget {
  const TimePlannerScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyPlanner App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
