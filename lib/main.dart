import 'package:filters_camera/provider/app_state.dart';
import 'package:filters_camera/ui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppStateProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.amberAccent,
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
