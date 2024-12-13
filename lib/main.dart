import 'package:flutter/material.dart';
import 'package:the_nice_funstantic_park/page/login.dart';
import 'package:the_nice_funstantic_park/page/splashscreen.dart';
import 'package:the_nice_funstantic_park/page/ulasan.dart';
import 'package:the_nice_funstantic_park/page/utama.dart';

// import 'package:the_nice_funstantic_park/page/utama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}
