import 'package:flutter/material.dart';
import 'package:image_search_0130/data/di/provider_setup.dart';
import 'package:image_search_0130/presentation/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: globalProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
