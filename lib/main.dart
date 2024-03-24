import 'package:flutter/material.dart';
import 'package:highlights/screens/splashscreen.dart';


///  Created by Shreyas Vilaschandra Bhike on 24/03/24.

/// Instagram
/// TheAppWizard
/// theappwizard2408

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'H I G H L I G H T S',
      home: SplashScreen(),
    );
  }
}









