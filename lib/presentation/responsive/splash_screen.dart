import 'dart:async';

import 'package:clothes/core/app_colors.dart';
import 'package:clothes/presentation/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startProgress();
  }

  void startProgress() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.logoColor,
      body: Center(
        child: Container(
          height: 200,
          width: double.infinity,
          color: AppColors.logoColor,
          child: Image.asset(
            'assets/logo.png',
          ),
        ),
      ),
    );
  }
}
