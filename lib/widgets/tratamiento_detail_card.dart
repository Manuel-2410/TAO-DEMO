import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/tratamiento.dart';

class TratamientoDetailCard extends StatelessWidget {
  String get plantillaTratamiento =>
      """
${tratamiento.titulo}

${tratamiento.descripcion}

Beneficios

${tratamiento.beneficios}

Inversión

${tratamiento.pagos}

""";

  Future<void> abrirWhatsapp() async {
    final mensaje = Uri.encodeComponent(plantillaTratamiento);

    final url = Uri.parse("https://wa.me/526642511108?text=$mensaje");

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  void compartir() {
    Share.share(plantillaTratamiento);
  }

  Future<void> copiarTodo(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: plantillaTratamiento));

    if (!context.mounted) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('Información del tratamiento copiada'),
          duration: Duration(seconds: 2),
        ),
      );
  }

  final Tratamiento tratamiento;

  const TratamientoDetailCard({super.key, required this.tratamiento});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),

              child: Image.asset(
                tratamiento.icono,

                height: 250,

                width: double.infinity,

                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 24),

            Text(
              tratamiento.titulo,

              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            const Text(
              "Descripción",

              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(tratamiento.descripcion),

            const SizedBox(height: 25),

            const Text(
              "Beneficios",

              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(tratamiento.beneficios),

            const SizedBox(height: 25),

            const Text(
              "Inversión",

              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(tratamiento.pagos),

            const SizedBox(height: 30),

            Wrap(
              spacing: 15,
              runSpacing: 10,
              children: [
                FilledButton.icon(
                  onPressed: abrirWhatsapp,
                  icon: const Icon(Icons.chat),
                  label: const Text("WhatsApp"),
                ),
                OutlinedButton.icon(
                  onPressed: compartir,
                  icon: const Icon(Icons.share),
                  label: const Text("Compartir"),
                ),
                OutlinedButton.icon(
                  onPressed: () => copiarTodo(context),
                  icon: const Icon(Icons.copy_all_outlined),
                  label: const Text('Copiar todo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
