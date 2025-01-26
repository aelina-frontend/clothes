import 'package:clothes/clothes_app/screens/home_screen_body/first_info.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(),
        body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      FirstInfo(),
                    ],
                  ),
                ),
              ],
            )));
  }
}
