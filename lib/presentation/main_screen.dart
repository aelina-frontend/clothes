import 'package:clothes/core/app_constants/app_function.dart';
import 'package:clothes/data/navigation_data.dart';
import 'package:clothes/data/social_media.dart';
import 'package:clothes/presentation/responsive/desktop_screen.dart';
import 'package:clothes/presentation/responsive/mobile_screen.dart';
import 'package:clothes/presentation/responsive/splash_screen.dart';
import 'package:clothes/presentation/responsive/tablet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/app_colors.dart';
import 'cubit/clothes_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<GlobalKey> keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  ScrollController _scrollController = ScrollController();

  void scrollToIndex(GlobalKey key) async {
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(context,
          duration: Duration(seconds: 1), curve: Curves.linear, alignment: 0.5);
    }
  }

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
          controller: _scrollController,
          isMobile: isMobile,
          isTablet: isTablet,
          isDesktop: isDesktop,
          key1: keys[0],
          key2: keys[1],
          key3: keys[2],
          key4: keys[3],
        ));
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
            ))
          : null,
      title: _buildAppBarTitle(isDesktop),
      actions: _buildAppBarActions(isDesktop),
    );
  }

  Widget _buildAppBarTitle(bool isDesktop) {
    if (isDesktop) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: navigation.asMap().entries.map((entry) {
          int index = entry.key; // Индекс элемента
          var item = entry.value; // Сам элемент

          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                scrollToIndex(keys[index]); // Используем индекс
              },
              child: Text(item.title),
            ),
          );
        }).toList(),
      );
    } else {
      return const SizedBox();
    }
  }

  List<Widget> _buildAppBarActions(bool isDesktop) {
    if (isDesktop) {
      return socialMedia
          .map((item) => Padding(
                padding: const EdgeInsets.only(right: 15),
                child: GestureDetector(
                  onTap: () {
                    AppFunctions.openSocialMedia(item.url);
                  },
                  child: CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.black,
                      child: Icon(
                        item.icon,
                        color: AppColors.white,
                        size: 15,
                      )),
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
                onTap: () {
                  scrollToIndex(keys[index]);
                  Navigator.pop(context);
                },
                leading: Icon(navigation[index].icon),
                title: Text(navigation[index].title),
              );
            }),
      );
    } else {
      return const SizedBox();
    }
  }
}

class BodyContent extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;
  final GlobalKey key1;
  final GlobalKey key2;
  final GlobalKey key3;
  final GlobalKey key4;
  final ScrollController controller;

  const BodyContent(
      {super.key,
      required this.isMobile,
      required this.isTablet,
      required this.isDesktop,
      required this.key1,
      required this.key2,
      required this.key3,
      required this.key4,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return MobileScreen(
        controller: controller,
        isTablet: isTablet,
        isMobile: isMobile,
        key1: key1,
        key2: key2,
        key3: key3,
        key4: key4,
      );
    } else if (isTablet) {
      return TabletScreen(
        isTablet: isTablet,
        key1: key1,
        key2: key2,
        key3: key3,
        key4: key4,
      );
    } else {
      return DesktopScreen(
        isDesktop: isDesktop,
        key1: key1,
        key2: key2,
        key3: key3,
        key4: key4,
      );
    }
  }
}
