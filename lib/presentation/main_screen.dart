import 'package:clothes/core/app_constants/app_function.dart';
import 'package:clothes/data/navigation_data.dart';
import 'package:clothes/data/social_media.dart';
import 'package:clothes/presentation/responsive/desktop_screen.dart';
import 'package:clothes/presentation/responsive/mobile_screen.dart';
import 'package:clothes/presentation/responsive/tablet_screen.dart';
import 'package:flutter/material.dart';

import '../core/app_colors.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1200;
    final bool isDesktop = screenWidth >= 1200;
    return Scaffold(
      appBar: _buildAppBar(isDesktop),
        drawer: _buildDrawer(isMobile, isTablet),
        body: BodyContent(
            isMobile: isMobile, isTablet: isTablet, isDesktop: isDesktop)
    );
  }
  PreferredSizeWidget _buildAppBar(bool isDesktop) {
    return AppBar(
      backgroundColor: AppColors.white,
      centerTitle: true,
      leadingWidth: isDesktop ? 120 : 60,
      leading: isDesktop
          ? const Center(
          child: Text(
            'AKULUX',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
      )
          : null,
      title: _buildAppBarTitle(isDesktop),
      actions: _buildAppBarActions(isDesktop),
    );
  }

  Widget _buildAppBarTitle(bool isDesktop) {
    if (isDesktop) {
      return Row(
          mainAxisSize: MainAxisSize.min,
          children: navigation
              .map((item)
          =>
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(item.title),
              )
          )
              .toList()
      );
    } else {
      return const SizedBox();
    }
  }

  List<Widget> _buildAppBarActions(bool isDesktop) {
    if (isDesktop) {
      return socialMedia
          .map((item) =>
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: (){
                AppFunctions.openSocialMedia(item.url);
              },
              child: CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.black,
                  child: Icon(item.icon, color: AppColors.white, size: 15,)),
            ),
          ))
          .toList();
    } else {
      return [];
    }
  }

  Widget _buildDrawer(bool isMobile, bool isTablet) {
    if (isMobile || isTablet) {
      return Drawer(
        child: ListView.builder(
            itemCount: navigation.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {},
                leading: Icon(navigation[index].icon),
                title: Text(navigation[index].title),
              );
            }),
      );
    } else {
      return SizedBox();
    }
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
    if (isMobile) {
      return MobileScreen(isTablet: isTablet, isMobile: isMobile);
    } else if (isTablet) {
      return TabletScreen(isTablet: isTablet);
    } else {
      return DesktopScreen(isDesktop: isDesktop);
    }
  }
}