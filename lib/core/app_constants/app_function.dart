import 'package:url_launcher/url_launcher.dart';

class AppFunctions {
  static Future<void> openSocialMedia(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $urlString');
    }
  }
}
