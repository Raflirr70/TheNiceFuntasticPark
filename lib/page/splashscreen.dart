import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:the_nice_funstantic_park/page/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Menunda Sebanyak 3 Detik
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 50,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/img/logogerak.gif', // Path ke gambar GIF
                  ),
                  // SizedBox(
                  //   height: -20,
                  // ),
                  Text(
                    'The Nice',
                    style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1B1B1B)),
                  ),
                  Text(
                    'Funtastic Park',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1B1B1B)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
