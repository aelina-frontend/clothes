import 'package:clothes/core/app_constants/app_string.dart';
import 'package:flutter/material.dart';

List<Navigation> navigation = [
  Navigation(title: AppString.main, icon: Icons.home_outlined),
  Navigation(title: AppString.aboutUs, icon: Icons.person_2_outlined),
  Navigation(title: AppString.contacts, icon: Icons.shopping_cart_outlined),
  Navigation(title: AppString.contacts, icon: Icons.phone_outlined),
];

class Navigation {
  final String title;
  final IconData icon;

  Navigation({required this.title, required this.icon});
}