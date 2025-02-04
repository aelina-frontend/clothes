import 'package:clothes/feature/presentation/screens/tablet_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/app_colors.dart';
import 'desktop_screen.dart';
import 'mobile_screen.dart';

class SocialMedia 
{
  final IconData icon;
  final String url;

  const SocialMedia({required this.icon, required this.url});
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<String> screens = ['ГЛАВНАЯ', 'О НАС', 'КАТАЛОГ', 'КОНТАКТЫ'];

  // List<IconData> icons = [
  //   Bootstrap.whatsapp,
  //   Bootstrap.instagram,
  //   Bootstrap.telegram,
  //   Icons.phone_outlined
  // ];

  List<Navigation> navigation = [
    Navigation(title: 'ГЛАВНАЯ', icon: Icons.home_outlined),
    Navigation(title: 'О НАС', icon: Icons.person_2_outlined),
    Navigation(title: 'КАТАЛОГ', icon: Icons.shopping_cart_outlined),
    Navigation(title: 'КОНТАКТЫ', icon: Icons.phone_outlined),
  ];

  
  static const List<SocialMedia> _socialMedia = [
    SocialMedia(icon: Bootstrap.whatsapp, url: "https://wa.clck.bar/996501707309?text=%D0%97%D0%B4%D1%80%D0%B0%D0%B2%D1%81%D1%82%D0%B2%D1%83%D0%B9%D1%82%D0%B5,%20%D1%8F%20%D0%BF%D0%B8%D1%88%D1%83%20%D1%81%20%D1%81%D0%B0%D0%B9%D1%82%D0%B0%20AKULUX,%20"),
    SocialMedia(icon: Bootstrap.instagram, url:  'https://instagram.com/jyldyzbek_maratov' ),
  SocialMedia(icon: Bootstrap.telegram, url: 'https://t.me/aku_brend'),
    SocialMedia(icon: Icons.phone_outlined, url: 'tel:+996500520412',),
  ];
  // void openSocialMedia()async{
  //   Uri url = Uri.parse("https://wa.me/+996501707309?text=${Uri.encodeComponent('Я пишу с сайта AKULUX')}");
  //   if(await canLaunchUrl(url)){
  //     await launchUrl(url, mode: LaunchMode.externalApplication);
  //   }else{
  //     print('не удалось открыть');
  //   }
  // }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $urlString');
    }
  }
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
        leadingWidth: isDesktop ? 120 : 60,
        leading: isDesktop
            ? const Center(
                child: Text(
                'AKULUX',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ))
            : null,
        title: Row(
            mainAxisSize: MainAxisSize.min,
            children: isDesktop
                ? screens
                    .map((item) => Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(item),
                        ))
                    .toList()
                : []),
        actions: isDesktop
            ? _socialMedia
                .map((item) => Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: InkWell(
                        onTap: (){
                          _launchUrl(item.url);
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
                .toList()
            : [],
      ),
      drawer: (isMobile || isTablet)
          ? Drawer(
              child: ListView.builder(
                  itemCount: navigation.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {},
                      leading: Icon(navigation[index].icon),
                      title: Text(navigation[index].title),
                    );
                  }),
            )
          : null,
      body: BodyContent(
          isMobile: isMobile, isTablet: isTablet, isDesktop: isDesktop),
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
    if (isMobile) {
      return const MobileScreen();
    } else if (isTablet) {
      return const TabletScreen();
    } else {
      return const DesktopScreen();
    }
  }
}

class Navigation {
  final String title;
  final IconData icon;

  Navigation({required this.title, required this.icon});
}
