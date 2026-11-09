import 'package:url_launcher/url_launcher.dart';

Future<void> openWebsite(String url) async {
  final Uri uri = Uri.parse(url);

  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication, // opens browser
  )) {
    throw 'Could not launch $url';
  }
}

Future<void> sendWhatsAppMessage({
  required String phone,
  required String name,
  required String email,
  required String message,
}) async {
  final String text = "📩 New Contact Form Submission\n\n"
      "📧 Name: $name\n"
      "📧 Email: $email\n"
      "💬 Message: $message";

  final Uri uri = Uri.parse(
    "https://wa.me/$phone?text=${Uri.encodeComponent(text)}",
  );

  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not open WhatsApp';
  }
}
