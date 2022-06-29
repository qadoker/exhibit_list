import 'package:flutter/material.dart';
import 'package:techincal_task/presentation/screens/exhibit_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exhibit List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExhibitListScreen(),
    );
  }
}
