import 'package:url_launcher/url_launcher.dart';

class WhatsappService {

  static Future<void> enviarMensaje(
    String texto,
  ) async {

    final url = Uri.parse(
      'https://wa.me/?text=${Uri.encodeComponent(texto)}',
    );

    await launchUrl(url);
  }
}