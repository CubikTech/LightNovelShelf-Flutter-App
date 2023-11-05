import 'package:flutter/material.dart';
import 'navigation.dart';
const colDivider = SizedBox(height: 10);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '轻书架',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LightNovelShelfApp(),
    );
  }
}

class LightNovelShelfApp extends StatefulWidget {
  const LightNovelShelfApp({super.key});

  @override
  State<LightNovelShelfApp> createState() => _LightNovelShelfAppState();
}

class _LightNovelShelfAppState extends State<LightNovelShelfApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: MyNavigationDrawer(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
