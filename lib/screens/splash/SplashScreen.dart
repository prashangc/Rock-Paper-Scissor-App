import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/screens/homepage/HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 1),
        () => Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const HomePage()))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}
