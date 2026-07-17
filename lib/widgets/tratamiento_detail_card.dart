import 'package:flutter/material.dart';

import '../models/tratamiento.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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

            Row(
              children: [
                FilledButton.icon(
                  onPressed: abrirWhatsapp,

                  icon: const Icon(Icons.chat),

                  label: const Text("WhatsApp"),
                ),

                const SizedBox(width: 15),

                OutlinedButton.icon(
                  onPressed: compartir,

                  icon: const Icon(Icons.share),

                  label: const Text("Compartir"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
