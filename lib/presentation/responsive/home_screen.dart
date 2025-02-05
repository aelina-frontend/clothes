import 'package:clothes/core/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.logoColor,
      body: Center(
        child: Container(
          height: 200,
          width: double.infinity,
          color: AppColors.logoColor,
          child: Image.asset('assets/logo.png',),
        ),
      ),
    );
  }
}
