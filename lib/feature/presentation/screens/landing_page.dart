import 'package:clothes/clothes_app/core/app_colors.dart';
import 'package:clothes/feature/presentation/screens/tablet_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import 'desktop_screen.dart';
import 'mobile_screen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<String> screens = ['ГЛАВНАЯ', 'О НАС', 'КАТАЛОГ', 'КОНТАКТЫ'];

  List<IconData> icons = [Bootstrap.whatsapp, Bootstrap.instagram, Bootstrap.telegram, Icons.phone_outlined];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1200;
    final bool isDesktop = screenWidth >= 1200;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leadingWidth: 120,
        leading: isDesktop ? const Center(child: Text('AKULUX', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)) : null,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: isDesktop ? screens
              .map((item) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(item),
          ))
              .toList() : []
        ),
        actions: isDesktop
            ? icons
                .map((item) => Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: CircleAvatar(
                          radius: 17, backgroundColor: Colors.black, child: Icon(item, color: AppColors.white, size: 15,)),
                    ))
                .toList()
            : [],
      ),
      drawer: (isMobile || isTablet)
          ? Drawer(
              child: ListView.builder(
                  itemCount: screens.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.account_circle),
                      title: Text(screens[index]),
                    );
                  }),
            )
          : null,
      body: BodyContent(isMobile: isMobile, isTablet: isTablet, isDesktop: isDesktop),
    );
  }
}

class BodyContent extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;

  const BodyContent(
      {super.key,
      required this.isMobile,
      required this.isTablet,
      required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    if(isMobile){
      return const MobileScreen();
    }else if(isTablet){
      return const TabletScreen();
    }else{
      return const DesktopScreen();
    }
  }
}




