import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SocialMedia {
  final IconData icon;
  final String url;

  const SocialMedia({required this.icon, required this.url});
}

List<SocialMedia> socialMedia = const [
  SocialMedia(
      icon: Bootstrap.whatsapp,
      url:
          "https://wa.clck.bar/996501707309?text=%D0%97%D0%B4%D1%80%D0%B0%D0%B2%D1%81%D1%82%D0%B2%D1%83%D0%B9%D1%82%D0%B5,%20%D1%8F%20%D0%BF%D0%B8%D1%88%D1%83%20%D1%81%20%D1%81%D0%B0%D0%B9%D1%82%D0%B0%20AKULUX,%20"),
  SocialMedia(
      icon: Bootstrap.instagram,
      url: 'https://instagram.com/jyldyzbek_maratov'),
  SocialMedia(icon: Bootstrap.telegram, url: 'https://t.me/aku_brend'),
  SocialMedia(
    icon: Icons.phone_outlined,
    url: 'tel:+996500520412',
  ),
];
