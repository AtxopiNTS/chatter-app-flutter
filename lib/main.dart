import 'package:flutter/material.dart';
import 'package:chatter_app/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatter App',
      initialRoute: 'users',
      routes: appRoutes,
    );
  }
}