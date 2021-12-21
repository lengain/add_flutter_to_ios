import 'package:flutter/material.dart';
import 'package:flutter_original_module/page_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PageRouterViewController(),
    );
  }
}
